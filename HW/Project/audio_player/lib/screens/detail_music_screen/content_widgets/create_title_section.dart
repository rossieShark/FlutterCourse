import 'package:audio_player/databases/database.dart';

import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class CreateTitleSection extends StatelessWidget {
  final DetailInfoSong? songInfo;
  final String param;
  const CreateTitleSection(
      {super.key, required this.songInfo, required this.param});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButtonWidget(
            iconData: Icons.ios_share,
            color: AppColors.accent.color,
            onPressed: () {}),
        CreateSongTitle(
          artistName: songInfo?.artistNames,
          songTitle: songInfo?.title,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
        LikeButtonWidget(
            id: songInfo?.id.toString() ?? '',
            artistNames: songInfo?.artistNames ?? '',
            title: songInfo?.title ?? '',
            image: songInfo?.imageUrl ?? ''),
      ],
    );
  }
}
