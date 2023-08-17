import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyFavoriteAlbum extends StatelessWidget {
  const MyFavoriteAlbum({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.background.color,
      appBar: AppBar(
        backgroundColor: AppColors.background.color,
        title: Center(
            child: Text(
          "All tracks",
          style: Theme.of(context).textTheme.titleMedium,
        )),
        leading: IconButtonWidget(
            iconData: Icons.arrow_back_ios,
            color: AppColors.accent.color,
            onPressed: () {
              context.go('/my_music');
            }),
        actions: [
          IconButtonWidget(
              iconData: Icons.filter_list_alt,
              color: AppColors.accent.color,
              onPressed: () {})
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FavoriteSongsList(
          favoriteProvider: favoriteProvider,
        ),
      ),
    );
  }
}

class FavoriteSongsList extends StatelessWidget {
  final FavoriteProvider favoriteProvider;
  const FavoriteSongsList({
    super.key,
    required this.favoriteProvider,
  });

  @override
  Widget build(BuildContext context) {
    return favoriteProvider.favoriteAlbum.isEmpty
        ? const Center(child: Text('No Songs yet'))
        : FavoriteAlbumListView(favoriteProvider: favoriteProvider);
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
    final double maxWidth = MediaQuery.of(context).size.width;
    return ListView.separated(
        itemCount: favoriteProvider.favoriteAlbum.length,
        separatorBuilder: (context, index) => const Divider(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final song = favoriteProvider.favoriteAlbum[index];
          return GestureDetector(
            onTap: () {
              String id = song.id;
              String title = song.artist_names;

              context.go(Uri(
                path: '/album_detail/$id',
                queryParameters: {'title': title},
              ).toString());
            },
            child: Dismissible(
              key: Key(song.id),
              direction: DismissDirection.endToStart,
              background: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                color: Colors.red,
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              onDismissed: (direction) {
                favoriteProvider.removeFromFavoritesAlbum(song);
              },
              child: SizedBox(
                  height: getResponsiveSize(maxWidth, 100),
                  width: MediaQuery.of(context).size.width - 32,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    getResponsiveSize(maxWidth, 80) / 2),
                                child: SizedBox(
                                  width: getResponsiveSize(maxWidth, 80),
                                  height: getResponsiveSize(maxWidth, 80),
                                  child: Image.network(song.header_image_url,
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 20, 0, 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    song.artist_names,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(song.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium)
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                          child: IconButtonWidget(
                              iconData: Icons.keyboard_control,
                              color: AppColors.white.color,
                              onPressed: () {}),
                        )
                      ])),
            ),
          );
        });
  }
}
