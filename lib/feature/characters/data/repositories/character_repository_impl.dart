import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:mvp_project/core/error/failure.dart';
import 'package:mvp_project/db/app_database.dart';
import 'package:mvp_project/feature/characters/data/data_source/character_remote_data_source.dart';
import 'package:mvp_project/feature/characters/data/models/character_model.dart';
import 'package:mvp_project/feature/characters/domain/entities/character_entity.dart';
import 'package:mvp_project/feature/characters/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl extends CharacterRepository {
  final CharacterRemoteDataSource remoteDataSource;
  final AppDatabase db;

  CharacterRepositoryImpl(this.remoteDataSource, this.db);

  @override
  Future<Either<Failure, List<CharacterEntity>>> getCharacter(int page) async {
    try {
      // Preserve existing favourites before updating
      final existing = await db.getAllCharacters();
      final favMap = {for (final row in existing) row.id: row.isFavorite};

      final remoteModels = await remoteDataSource.getCharacter(page);

      final companions = remoteModels
          .map(
            (m) => m.toDrift().copyWith(
              isFavorite: Value(favMap[m.id] ?? m.isFavorite),
            ),
          )
          .toList();

      await db.insertOrUpdateCharacters(companions);

      final stored = await db.getAllCharacters();

      final entities = stored
          .map((row) => CharacterModel.fromDrift(row))
          .toList();

      return Right(entities);
    } on DioException {
      // Network error - fallback to local database
      try {
        final stored = await db.getAllCharacters();
        if (stored.isNotEmpty) {
          // When offline, return all cached characters (ignore page parameter)
          final cachedEntities = stored
              .map((row) => CharacterModel.fromDrift(row))
              .toList();

          // If requesting page 1, return all cached data
          // For pagination when offline, we'll handle it differently
          if (page == 1) {
            return Right(cachedEntities);
          } else {
            // For subsequent pages when offline, return empty list
            // This signals that there's no more data available
            return const Right([]);
          }
        } else {
          // No cached data and network failed
          return Left(
            ServerFailure(
              'No internet connection and no cached data available',
            ),
          );
        }
      } catch (dbError) {
        return Left(CacheFailure('Failed to load cached data: $dbError'));
      }
    } catch (e) {
      // Other errors - try to fallback to local database
      try {
        final stored = await db.getAllCharacters();
        if (stored.isNotEmpty) {
          final cachedEntities = stored
              .map((row) => CharacterModel.fromDrift(row))
              .toList();
          return Right(cachedEntities);
        }
      } catch (_) {}

      return Left(ServerFailure('Failed to load characters: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<CharacterEntity>>> getFavourite() async {
    try {
      final stored = await db.getFavouriteCharacter();
      final onlyFav = stored.where((row) => row.isFavorite == true).toList();
      final entities = onlyFav
          .map((row) => CharacterModel.fromDrift(row))
          .toList();
      return Right(entities);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<void> toggleFavourite(CharacterEntity character) async {
    await db.toggleFavourite(character.id);
  }
}
