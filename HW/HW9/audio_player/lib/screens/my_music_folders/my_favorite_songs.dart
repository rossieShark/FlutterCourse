import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyFavoriteSongs extends StatelessWidget {
  const MyFavoriteSongs({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.background.color,
      appBar: AppBar(
        backgroundColor: AppColors.background.color,
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
    return favoriteProvider.favoriteSong.isEmpty
        ? const Center(child: Text('No Songs yet'))
        : FavoriteSongListView(favoriteProvider: favoriteProvider);
  }
}

class FavoriteSongListView extends StatelessWidget {
  const FavoriteSongListView({
    super.key,
    required this.favoriteProvider,
  });

  final FavoriteProvider favoriteProvider;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: favoriteProvider.favoriteSong.length,
        separatorBuilder: (context, index) => const Divider(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final song = favoriteProvider.favoriteSong[index];
          return GestureDetector(
            onTap: () {
              String id = song.id;

              context.go(Uri(path: '/detail_music/$id').toString());
            },
            child: Dismissible(
              key: Key(song.id),
              direction: DismissDirection.endToStart,
              background: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                color: Colors.red, // Background color when swiping
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              onDismissed: (direction) {
                favoriteProvider.removeFromFavorites(song);
              },
              child: SizedBox(
                  height: 70,
                  width: MediaQuery.of(context).size.width - 32,
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: SizedBox(
                          width: 60,
                          height: 60,
                          child: Image.network(song.header_image_url,
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width -
                              60 -
                              16 * 4 -
                              48,
                          child: Text(
                            song.title,
                            style: Theme.of(context).textTheme.bodyMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(song.artist_names,
                            style: Theme.of(context).textTheme.bodySmall),
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
