import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mvp_project/core/error/failure.dart';
import 'package:mvp_project/feature/characters/domain/entities/character_entity.dart';
import 'package:mvp_project/feature/characters/domain/usecases/get_character_usecases.dart';

part 'character_event.dart';

part 'character_state.dart';

part 'character_bloc.freezed.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetCharactersUseCase getCharactersUseCase;

  static const int _pageSize = 20;

  CharacterBloc(this.getCharactersUseCase) : super(const CharacterState()) {
    on<_Load>(_onLoad);
    on<_Started>(_onStarted);
    on<_Refresh>(_onRefresh);
    on<_Toggle>(_onToggle);
  }

  Future<void> _onStarted(_Started event, Emitter<CharacterState> emit) async {
    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: null,
        characters: [],
        currentPage: 1,
        hasMore: true,
      ),
    );

    final result = await getCharactersUseCase(1);

    result.fold(
      (Failure failure) {
        emit(state.copyWith(isLoading: false, errorMessage: failure.message));
      },
      (List<CharacterEntity> characters) {
        emit(
          state.copyWith(
            isLoading: false,
            characters: characters,
            currentPage: 1,
            hasMore: characters.length >= _pageSize && characters.isNotEmpty,
            errorMessage: null,
          ),
        );
      },
    );
  }

  Future<void> _onLoad(_Load event, Emitter<CharacterState> emit) async {
    if (!state.hasMore || state.isLoadingMore || state.isLoading) return;

    emit(state.copyWith(isLoadingMore: true, errorMessage: null));

    final nextPage = state.currentPage + 1;
    final result = await getCharactersUseCase(nextPage);

    result.fold(
      (Failure failure) {
        emit(
          state.copyWith(
            isLoadingMore: false,
            hasMore: false,
            errorMessage: null,
          ),
        );
      },
      (List<CharacterEntity> characters) {
        if (characters.isEmpty) {
          emit(state.copyWith(isLoadingMore: false, hasMore: false));
          return;
        }

        final updatedList = List<CharacterEntity>.from(state.characters)
          ..addAll(characters);

        emit(
          state.copyWith(
            isLoadingMore: false,
            characters: updatedList,
            currentPage: nextPage,
            hasMore: characters.length >= _pageSize,
            errorMessage: null,
          ),
        );
      },
    );
  }

  Future<void> _onRefresh(_Refresh event, Emitter<CharacterState> emit) async {
    add(const CharacterEvent.started());
  }

  void _onToggle(_Toggle event, Emitter<CharacterState> emit) {
    final updated = state.characters
        .map(
          (c) => c.id == event.id ? c.copyWith(isFavorite: !c.isFavorite) : c,
        )
        .toList();
    emit(state.copyWith(characters: updated));
  }
}
