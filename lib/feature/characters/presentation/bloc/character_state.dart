part of 'character_bloc.dart';

@freezed
abstract class CharacterState with _$CharacterState {
  const factory CharacterState({
    @Default(<CharacterEntity>[]) List<CharacterEntity> characters,
    @Default(1) int currentPage,
    @Default(true) bool hasMore,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    String? errorMessage,
  }) = _CharacterState;
}
