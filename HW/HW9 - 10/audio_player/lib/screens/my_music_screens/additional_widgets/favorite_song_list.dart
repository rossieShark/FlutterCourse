import 'package:audio_player/models/favorite_folder_model.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
                context.push('/albums');
              } else {
                context.push('/tracks');
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
