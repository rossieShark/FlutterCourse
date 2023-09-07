import 'package:audio_player/models/favorite_folder_model.dart';
import 'package:audio_player/screens/tab_bar/index.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyMusicPage extends StatelessWidget {
  const MyMusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background.color,
      appBar: AppBar(
        elevation: 0.0,
        title: Align(
            alignment: Alignment.topLeft,
            child: Text('Your Library',
                style: Theme.of(context).textTheme.titleSmall)),
        backgroundColor: AppColors.background.color,
        leading: IconButtonWidget(
            iconData: Icons.my_library_music,
            color: AppColors.accent.color,
            onPressed: () {}),
        actions: [
          IconButtonWidget(
              iconData: Icons.add,
              color: AppColors.accent.color,
              onPressed: () {})
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: _MyFavoriteListView(),
      ),
    );
  }
}

class _MyFavoriteListView extends StatelessWidget {
  const _MyFavoriteListView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: folders.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (index == 0) {
                GoRouter.of(context)
                    .push('/${routeNameMap[RouteName.favoriteAlbums]!}');
              } else {
                GoRouter.of(context)
                    .push('/${routeNameMap[RouteName.favoriteTracks]!}');
              }
            },
            child: _FavouritefoldersCard(index: index),
          );
        });
  }
}

class _FavouritefoldersCard extends StatelessWidget {
  const _FavouritefoldersCard({required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: MediaQuery.of(context).size.width - 32,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: folders[index].image),
            ),
            Text(
              folders[index].title,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: AppFonts.lusitana.font,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        folders[index].iconButton
      ]),
    );
  }
}

List<FavoriteFolder> folders = [
  FavoriteFolder(
      image: Icon(
        Icons.album,
        color: AppColors.white.color,
      ),
      title: "Albums",
      iconButton: IconButtonWidget(
        iconData: Icons.arrow_forward_ios,
        color: AppColors.white.color,
        onPressed: () {},
      )),
  FavoriteFolder(
    image: Icon(Icons.music_note, color: AppColors.white.color),
    title: "Tracks",
    iconButton: IconButtonWidget(
      iconData: Icons.arrow_forward_ios,
      color: AppColors.white.color,
      onPressed: () {},
    ),
  ),
];
