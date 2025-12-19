import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mvp_project/core/di/injection.dart';
import 'package:mvp_project/feature/characters/presentation/bloc/character_bloc.dart';
import 'package:mvp_project/feature/characters/presentation/pages/characters_page.dart';
import 'package:mvp_project/feature/favourite/bloc/favourites_bloc.dart';
import 'package:mvp_project/feature/favourite/pages/selected_page.dart';
import 'package:mvp_project/feature/main/main_page.dart';
import 'package:mvp_project/router/app_routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutes.home.path,
  routes: [
    StatefulShellRoute.indexedStack(
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.home.path,
              name: AppRoutes.home.name,
              builder: (_, state) => const CharactersPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.favourite.path,
              name: AppRoutes.favourite.name,
              builder: (_, state) => const SelectedPage(),
            ),
          ],
        ),
      ],
      builder: (_, __, navigationShell) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<CharacterBloc>(
              create: (_) =>
                  sl<CharacterBloc>()..add(const CharacterEvent.started()),
            ),
            BlocProvider<FavouritesBloc>(
              create: (_) =>
                  sl<FavouritesBloc>()..add(const FavouritesEvent.load()),
            ),
          ],
          child: MainPage(navigationShell: navigationShell),
        );
      },
    ),
  ],
);
