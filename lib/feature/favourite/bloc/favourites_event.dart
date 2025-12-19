part of 'favourites_bloc.dart';

@freezed
class FavouritesEvent with _$FavouritesEvent {
  const factory FavouritesEvent.load() = _Load;
  const factory FavouritesEvent.toggle(CharacterEntity character) = _Toggle;
}
