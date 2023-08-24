import 'package:audio_player/screens/my_music_screens/additional_widgets/favorite_song_list.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

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
