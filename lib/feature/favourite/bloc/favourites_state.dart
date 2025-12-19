part of 'favourites_bloc.dart';

@freezed
abstract class FavouritesState with _$FavouritesState {
  const factory FavouritesState({
    @Default([]) List<CharacterEntity> favourites,
    @Default(false) bool isLoading,
  }) = _FavouritesState;
}
