import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvp_project/core/theme/theme_cubit.dart';
import 'package:mvp_project/feature/favourite/bloc/favourites_bloc.dart';
import 'package:mvp_project/feature/characters/presentation/bloc/character_bloc.dart';

enum SortOption { name, status }

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _FavouritePage();
  }
}

class _FavouritePage extends StatefulWidget {
  const _FavouritePage();

  @override
  State<_FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<_FavouritePage> {
  SortOption _sortOption = SortOption.name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Избранные персонажи'),
        actions: [
          Row(
            children: [
              Icon(
                Icons.light_mode,
                color: context.watch<ThemeCubit>().state == ThemeMode.dark
                    ? Colors.grey
                    : Colors.amber,
              ),
              Switch(
                value: context.watch<ThemeCubit>().state == ThemeMode.dark,
                onChanged: (_) {
                  context.read<ThemeCubit>().toggleTheme();
                },
              ),
              Icon(
                Icons.dark_mode,
                color: context.watch<ThemeCubit>().state == ThemeMode.dark
                    ? Colors.amber
                    : Colors.grey,
              ),
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Theme.of(context).cardColor,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            alignment: Alignment.centerLeft,
            child: DropdownButton<SortOption>(
              value: _sortOption,
              onChanged: (value) {
                if (value != null) {
                  setState(() => _sortOption = value);
                }
              },
              items: const [
                DropdownMenuItem(
                  value: SortOption.name,
                  child: Text('По имени'),
                ),
                DropdownMenuItem(
                  value: SortOption.status,
                  child: Text('По статусу'),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<FavouritesBloc, FavouritesState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.favourites.isNotEmpty) {
                  List favoriteCharacters = state.favourites
                      .where((character) => character.isFavorite)
                      .toList();

                  if (_sortOption == SortOption.name) {
                    favoriteCharacters.sort((a, b) => a.name.compareTo(b.name));
                  } else if (_sortOption == SortOption.status) {
                    favoriteCharacters.sort(
                      (a, b) => a.status.compareTo(b.status),
                    );
                  }
                  return ListView.builder(
                    itemCount: favoriteCharacters.length,
                    itemBuilder: (context, index) {
                      final character = favoriteCharacters[index];

                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: character.image.isNotEmpty
                              ? CachedNetworkImageProvider(character.image)
                              : const AssetImage(
                                      'assets/images/default_avatar.png',
                                    )
                                    as ImageProvider,
                        ),
                        title: Text(character.name),
                        subtitle: Text(
                          '${character.species} — ${character.status}',
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.star, color: Colors.amber),
                          onPressed: () {
                            context.read<FavouritesBloc>().add(
                              FavouritesEvent.toggle(character),
                            );
                            context.read<CharacterBloc>().add(
                              CharacterEvent.toggle(character.id),
                            );
                          },
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text('Нет избранных персонажей'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
