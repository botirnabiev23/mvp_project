import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:mvp_project/db/tables/character_table.dart';
import 'package:mvp_project/db/tables/setting_table.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

@DriftDatabase(tables: [Characters, Settings])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) => m.createAll(),
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        await m.createTable(settings);
      }
    },
  );

  Future<List<Character>> getAllCharacters() => select(characters).get();

  Future<List<Character>> getFavouriteCharacter() => (select(
    characters,
  )..where((table) => table.isFavorite.equals(true))).get();

  Future<void> toggleFavourite(int id) async {
    final row = await (select(
      characters,
    )..where((t) => t.id.equals(id))).getSingle();

    final newValue = !row.isFavorite;
    await (update(characters)..where((t) => t.id.equals(id))).write(
      CharactersCompanion(isFavorite: Value(newValue)),
    );
  }

  Future<void> insertOrUpdateCharacters(
    List<CharactersCompanion> charactersList,
  ) {
    return batch((batch) {
      batch.insertAllOnConflictUpdate(characters, charactersList);
    });
  }

  Future<void> saveTheme(String themeMode) async {
    await into(settings).insertOnConflictUpdate(
      SettingsCompanion.insert(key: 'theme', value: themeMode),
    );
  }

  Future<String> getTheme() async {
    final row = await (select(
      settings,
    )..where((t) => t.key.equals('theme'))).getSingleOrNull();
    return row?.value ?? 'light';
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app.db'));
    return NativeDatabase(file);
  });
}
