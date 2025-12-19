import 'package:dartz/dartz.dart';
import 'package:mvp_project/core/error/failure.dart';
import 'package:mvp_project/feature/characters/domain/entities/character_entity.dart';
import 'package:mvp_project/feature/characters/domain/repositories/character_repository.dart';

class GetCharactersUseCase {
  final CharacterRepository repository;

  GetCharactersUseCase(this.repository);

  Future<Either<Failure, List<CharacterEntity>>> call(int page) {
    return repository.getCharacter(page);
  }
}
