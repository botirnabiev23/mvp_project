import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvp_project/core/theme/theme_cubit.dart';
import 'package:mvp_project/feature/characters/domain/entities/character_entity.dart';
import 'package:mvp_project/feature/characters/presentation/bloc/character_bloc.dart';
import 'package:mvp_project/feature/favourite/bloc/favourites_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

enum SortOption { name, status, species }

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _CharactersView();
  }
}

class _CharactersView extends StatefulWidget {
  const _CharactersView();

  @override
  State<_CharactersView> createState() => _CharactersViewState();
}

class _CharactersViewState extends State<_CharactersView> {
  SortOption _sortOption = SortOption.name;

  List<CharacterEntity> _getSortedCharacters(List<CharacterEntity> characters) {
    final sorted = List<CharacterEntity>.from(characters);
    switch (_sortOption) {
      case SortOption.name:
        sorted.sort((a, b) => a.name.compareTo(b.name));
        break;
      case SortOption.status:
        sorted.sort((a, b) => a.status.compareTo(b.status));
        break;
      case SortOption.species:
        sorted.sort((a, b) => a.species.compareTo(b.species));
        break;
    }
    return sorted;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Characters', style: TextStyle(fontSize: 18)),
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
                  child: Text('Sort by Name'),
                ),
                DropdownMenuItem(
                  value: SortOption.status,
                  child: Text('Sort by Status'),
                ),
                DropdownMenuItem(
                  value: SortOption.species,
                  child: Text('Sort by Species'),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<CharacterBloc, CharacterState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state.errorMessage != null) {
                  return Center(child: Text('Error: ${state.errorMessage}'));
                }

                if (state.characters.isEmpty) {
                  return const Center(child: Text('No characters found'));
                }

                final sortedCharacters = _getSortedCharacters(state.characters);

                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<CharacterBloc>().add(
                      const CharacterEvent.refresh(),
                    );
                  },
                  child: ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: sortedCharacters.length,
                    itemBuilder: (context, index) {
                      final character = sortedCharacters[index];
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
                          '${character.species} - ${character.status}',
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            character.isFavorite
                                ? Icons.star
                                : Icons.star_border,
                            color: character.isFavorite
                                ? Colors.amber
                                : Colors.grey,
                          ),
                          onPressed: () {
                            context.read<CharacterBloc>().add(
                              CharacterEvent.toggle(character.id),
                            );
                            context.read<FavouritesBloc>().add(
                              FavouritesEvent.toggle(character),
                            );
                          },
                        ),
                      );
                    },
                    separatorBuilder: (_, __) => const Divider(height: 1),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
