import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvp_project/feature/characters/domain/entities/character_entity.dart';
import 'package:mvp_project/feature/favourite/bloc/favourites_bloc.dart';
import 'package:mvp_project/feature/characters/presentation/bloc/character_bloc.dart';

enum SortOption { name, status }

class SelectedPage extends StatelessWidget {
  const SelectedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SelectedPage();
  }
}

class _SelectedPage extends StatefulWidget {
  const _SelectedPage();

  @override
  State<_SelectedPage> createState() => _SelectedPageState();
}

class _SelectedPageState extends State<_SelectedPage> {
  SortOption _sortOption = SortOption.name;

  List<CharacterEntity> _getSortedFavourites(List<CharacterEntity> favourites) {
    final sorted = List<CharacterEntity>.from(favourites);
    switch (_sortOption) {
      case SortOption.name:
        sorted.sort((a, b) => a.name.compareTo(b.name));
        break;
      case SortOption.status:
        sorted.sort((a, b) => a.status.compareTo(b.status));
        break;
    }
    return sorted;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Избранные персонажи'),
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
                  final sortedFavourites = _getSortedFavourites(
                    state.favourites,
                  );
                  return ListView.builder(
                    itemCount: sortedFavourites.length,
                    itemBuilder: (context, index) {
                      final character = sortedFavourites[index];

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
                    child: Text('Нажмите кнопку для загрузки'),
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
