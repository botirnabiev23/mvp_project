import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvp_project/feature/characters/domain/entities/character_entity.dart';
import 'package:mvp_project/feature/characters/domain/repositories/character_repository.dart';

part 'favourites_event.dart';

part 'favourites_state.dart';

part 'favourites_bloc.freezed.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  final CharacterRepository repository;

  FavouritesBloc(this.repository) : super(const FavouritesState()) {
    on<_Load>(_onLoad);
    on<_Toggle>(_onToggle);
  }

  Future<void> _onLoad(_Load event, Emitter<FavouritesState> emit) async {
    emit(state.copyWith(isLoading: true));

    final result = await repository.getFavourite();

    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false));
      },
      (favourites) {
        emit(state.copyWith(isLoading: false, favourites: favourites));
      },
    );
  }

  Future<void> _onToggle(_Toggle event, Emitter<FavouritesState> emit) async {
    await repository.toggleFavourite(event.character);
    add(const FavouritesEvent.load());
  }
}
