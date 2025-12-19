import 'package:drift/drift.dart';
import 'package:mvp_project/db/app_database.dart';
import 'package:mvp_project/feature/characters/data/models/character_model.dart';

class CharacterLocalDataSource {
  final AppDatabase db;

  CharacterLocalDataSource(this.db);

  Future<void> cacheCharacters(List<CharacterModel> characters) async {
    final entities = characters.map((c) => CharactersCompanion(
      id: Value(c.id),
      name: Value(c.name),
      status: Value(c.status),
      species: Value(c.species),
      image: Value(c.image),
      isFavorite: Value(false),
    )).toList();

    await db.insertOrUpdateCharacters(entities);
  }

  Future<List<CharacterModel>> getAllCharacters() async {
    final rows = await db.getAllCharacters();
    return rows.map((e) => CharacterModel.fromDrift(e)).toList();
  }
}