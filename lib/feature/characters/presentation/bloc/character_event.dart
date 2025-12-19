part of 'character_bloc.dart';

@freezed
class CharacterEvent with _$CharacterEvent {
  const factory CharacterEvent.started() = _Started;
  const factory CharacterEvent.load() = _Load;
  const factory CharacterEvent.refresh() = _Refresh;
  const factory CharacterEvent.toggle(int id) = _Toggle;
}
