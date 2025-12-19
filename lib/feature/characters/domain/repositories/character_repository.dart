import 'package:dartz/dartz.dart';
import 'package:mvp_project/core/error/failure.dart';
import 'package:mvp_project/feature/characters/domain/entities/character_entity.dart';

abstract class CharacterRepository {
  Future<Either<Failure, List<CharacterEntity>>> getCharacter(int page);
  Future<Either<Failure, List<CharacterEntity>>> getFavourite();
  Future<void> toggleFavourite(CharacterEntity character);
}
