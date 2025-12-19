import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mvp_project/core/theme/theme_cubit.dart';

import 'package:mvp_project/db/app_database.dart';
import 'package:mvp_project/feature/characters/data/data_source/character_remote_data_source.dart';
import 'package:mvp_project/feature/characters/data/repositories/character_repository_impl.dart';
import 'package:mvp_project/feature/characters/domain/repositories/character_repository.dart';
import 'package:mvp_project/feature/characters/domain/usecases/get_character_usecases.dart';
import 'package:mvp_project/feature/characters/presentation/bloc/character_bloc.dart';
import 'package:mvp_project/feature/favourite/bloc/favourites_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerLazySingleton<Dio>(
    () => Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api')),
  );

  sl.registerLazySingleton<AppDatabase>(() => AppDatabase());

  sl.registerLazySingleton<CharacterRemoteDataSource>(
    () => CharacterRemoteDataSourceImpl(sl<Dio>()),
  );

  sl.registerLazySingleton<CharacterRepository>(
    () => CharacterRepositoryImpl(
      sl<CharacterRemoteDataSource>(),
      sl<AppDatabase>(),
    ),
  );

  sl.registerLazySingleton<GetCharactersUseCase>(
    () => GetCharactersUseCase(sl<CharacterRepository>()),
  );

  sl.registerFactory<CharacterBloc>(
    () => CharacterBloc(sl<GetCharactersUseCase>()),
  );

  sl.registerFactory<FavouritesBloc>(
    () => FavouritesBloc(sl<CharacterRepository>()),
  );

  sl.registerLazySingleton<ThemeCubit>(() => ThemeCubit(sl<AppDatabase>()));
}
