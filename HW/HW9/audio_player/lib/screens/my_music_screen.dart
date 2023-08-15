import 'package:audio_player/models/favorite_folder_model.dart';

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
        backgroundColor: AppColors.background.color,
        title: Center(
            child: Text(
          "All tracks",
          style: Theme.of(context).textTheme.titleMedium,
        )),
        leading: IconButtonWidget(
            iconData: Icons.upload,
            color: AppColors.accent.color,
            onPressed: () {}),
        actions: [
          IconButtonWidget(
              iconData: Icons.filter_list_alt,
              color: AppColors.accent.color,
              onPressed: () {})
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: FavoriteSongsList(),
      ),
    );
  }
}

class FavoriteSongsList extends StatelessWidget {
  const FavoriteSongsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: folders.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (index == 0) {
                context.go('/albums');
              } else {
                context.go('/tracks');
              }
            },
            child: SizedBox(
                height: 70,
                width: MediaQuery.of(context).size.width - 32,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: folders[index].image),
                          ),
                          Text(folders[index].title,
                              style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                      folders[index].iconButton
                    ])),
          );
        });
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
      )),
];
