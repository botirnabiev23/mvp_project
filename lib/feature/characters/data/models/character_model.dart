import 'package:drift/drift.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mvp_project/db/app_database.dart';
import 'package:mvp_project/feature/characters/domain/entities/character_entity.dart';

part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel extends CharacterEntity {
  const CharacterModel({
    required super.id,
    required super.name,
    required super.status,
    required super.species,
    required super.image,
    super.isFavorite = false,
  });

  CharactersCompanion toDrift() {
    return CharactersCompanion(
      id: Value(id),
      name: Value(name),
      status: Value(status),
      image: Value(image),
      species: Value(species),
      isFavorite: Value(isFavorite),
    );
  }

  factory CharacterModel.fromDrift(Character data) {
    return CharacterModel(
      id: data.id,
      name: data.name,
      status: data.status,
      species: data.species,
      image: data.image,
      isFavorite: data.isFavorite,
    );
  }

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);

  factory CharacterModel.fromEntity(CharacterEntity entity) {
    return CharacterModel(
      id: entity.id,
      name: entity.name,
      status: entity.status,
      species: entity.species,
      image: entity.image,
      isFavorite: entity.isFavorite,
    );
  }

  CharacterEntity toEntity() => CharacterEntity(
    id: id,
    name: name,
    status: status,
    species: species,
    image: image,
    isFavorite: isFavorite,
  );
}
