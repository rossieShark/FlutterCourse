import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/screens/tab_bar/go_router.dart';
import 'package:audio_player/widgets/responsive_widgets/platform_widget/platform_widget.dart';
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
        leading: PlatformBuilder(
            // web: ResponsiveButton(
            //   iconData: Icons.arrow_back_ios,
            //   onPressed: null,
            //   color: Colors.transparent,
            // ),
            iOS: ResponsiveButton(
                iconData: Icons.arrow_back_ios,
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                color: AppColors.white.color),
            other: ResponsiveButton(
                iconData: Icons.arrow_back,
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                color: AppColors.white.color),
            builder: (context, child, data) {
              return IconButtonWidget(
                  iconData: data.iconData,
                  color: data.color,
                  onPressed: data.onPressed);
            }),
        actions: [
          IconButtonWidget(
              iconData: Icons.filter_list_alt,
              color: AppColors.accent.color,
              onPressed: () {
                favoriteProvider.toggleSortSong();
              })
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
        ? Center(
            child: Text(
            'No Songs yet',
            style: TextStyle(
                color: AppColors.white.color,
                fontSize: 20,
                fontFamily: AppFonts.colombia.font,
                fontWeight: FontWeight.w700),
          ))
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
    final double maxWidth = MediaQuery.of(context).size.width;
    const double padding = 16;
    return ListView.separated(
        itemCount: favoriteProvider.favoriteSong.length,
        separatorBuilder: (context, index) => const Divider(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final song = favoriteProvider.favoriteSong[index];
          return GestureDetector(
            onTap: () {
              String id = song.id;

              GoRouter.of(context).push(
                  Uri(path: '${routeNameMap[RouteName.detailMusic]!}$id')
                      .toString());
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
                favoriteProvider.removeFromFavorites(song);
              },
              child: ResponsiveBuilder(
                  narrow: 70.0,
                  medium: 90.0,
                  large: 90.0,
                  builder: (context, child, height) {
                    return SizedBox(
                      height: height,
                      width: maxWidth - 32,
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: SizedBox(
                              width: height,
                              height: height,
                              child: Image.network(song.header_image_url,
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        ResponsiveBuilder(
                            narrow: 13.0,
                            medium: 18.0,
                            large: 18.0,
                            builder: (context, child, size) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: maxWidth - height - padding * 7,
                                    child: Text(
                                      song.title,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: AppFonts.lusitana.font,
                                          fontSize: size,
                                          fontWeight: FontWeight.w500),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    song.artist_names,
                                    style: TextStyle(
                                        fontFamily: AppFonts.colombia.font,
                                        fontSize: size,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ],
                              );
                            }),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                          child: IconButtonWidget(
                              iconData: Icons.keyboard_control,
                              color: AppColors.white.color,
                              onPressed: () {}),
                        ),
                      ]),
                    );
                  }),
            ),
          );
        });
  }
}
