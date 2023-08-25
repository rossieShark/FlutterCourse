import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/screens/tab_bar/go_router.dart';
import 'package:audio_player/widgets/responsive_widgets/platform_widget/platform_widget.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
        leading: PlatformBuilder(
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
                favoriteProvider.toggleSortAlbum();
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
    return favoriteProvider.favoriteAlbum.isEmpty
        ? Center(
            child: Text(
            'No Songs yet',
            style: TextStyle(
                color: AppColors.white.color,
                fontSize: 20,
                fontFamily: AppFonts.colombia.font,
                fontWeight: FontWeight.w700),
          ))
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

              GoRouter.of(context).push(Uri(
                path: '${routeNameMap[RouteName.albumDetail]!}$id',
                queryParameters: {'title': title},
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
                favoriteProvider.removeFromFavoritesAlbum(song);
              },
              child: ResponsiveBuilder(
                  narrow: 100.0,
                  medium: 120.0,
                  large: 120.0,
                  builder: (context, child, height) {
                    return SizedBox(
                      height: height,
                      width: MediaQuery.of(context).size.width - 32,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 16, 0),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(height) / 2,
                                    child: SizedBox(
                                      width: height,
                                      height: height,
                                      child: Image.network(
                                          song.header_image_url,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 0, 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                32 -
                                                height -
                                                100,
                                        child: AutoSizeText(
                                          TextModifierService().removeTextAfter(
                                              song.artist_names),
                                          style: TextStyle(
                                              color: AppColors.white.color,
                                              fontSize: 20,
                                              fontFamily:
                                                  AppFonts.colombia.font,
                                              fontWeight: FontWeight.w700),
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,
                                          minFontSize: 6,
                                          stepGranularity: 1,
                                        ),
                                      ),
                                      AutoSizeText(
                                        TextModifierService()
                                            .removeTextAfter(song.title),
                                        style: TextStyle(
                                          fontFamily: AppFonts.montserrat.font,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.white.color,
                                          fontSize: 13,
                                        ),
                                        minFontSize: 6,
                                        stepGranularity: 1,
                                      )
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
                            ),
                          ]),
                    );
                  }),
            ),
          );
        });
  }
}
