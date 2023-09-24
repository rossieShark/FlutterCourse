import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/screens/my_music_screens/my_music_index.dart';

import 'package:audio_player/screens/tab_bar/index.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyFavoriteAlbum extends StatelessWidget {
  const MyFavoriteAlbum({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    return FavoritePageStructure(
        child: FavoriteBody(
      songs: favoriteProvider.favoriteAlbum,
      child: FavoriteAlbumListView(favoriteProvider: favoriteProvider),
    ));
  }
}

class FavoriteAlbumListView extends StatelessWidget {
  const FavoriteAlbumListView({
    super.key,
    required this.favoriteProvider,
  });

  final FavoriteProvider favoriteProvider;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context, listen: true);
    return ListView.separated(
        itemCount: favoriteProvider.favoriteAlbum.length,
        separatorBuilder: (context, index) => const Divider(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final song = provider.favoriteAlbum[index];
          return GestureDetector(
            onTap: () {
              String id = song.id;
              String image = song.image;

              GoRouter.of(context).push(Uri(
                path: '/${routeNameMap[RouteName.albumDetail]!}$id',
                queryParameters: {'image': image},
              ).toString());
            },
            child: Dismissible(
              key: Key(song.id),
              direction: DismissDirection.endToStart,
              background: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                color: AppColors.accent.color,
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              onDismissed: (direction) {
                provider.removeFromFavoritesAlbum(song);
              },
              child: CustomListViewContent(
                imageSection: ResponsiveBuilder(
                    narrow: 70.0,
                    medium: 90.0,
                    large: 90.0,
                    builder: (context, child, height) {
                      return CreateImageSection(song: song, height: height);
                    }),
                titleSection: CreateSongTitle(
                  artistName: song.artistNames,
                  songTitle: song.title,
                  maxLines: 2,
                ),
              ),
            ),
          );
        });
  }
}
