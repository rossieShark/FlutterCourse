import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/database.dart';
import 'package:audio_player/models/played_song_model.dart';
import 'package:audio_player/widgets/widget_exports.dart';

import 'package:flutter/material.dart';

class CreatMusicControlSection extends StatefulWidget {
  final DetailInfoSong songInfo;
  const CreatMusicControlSection({super.key, required this.songInfo});

  @override
  State<CreatMusicControlSection> createState() =>
      _CreatMusicControlSectionState();
}

class _CreatMusicControlSectionState extends State<CreatMusicControlSection> {
  void playPauseMusic(BuildContext context, MusicProvider musicProvider) {
    if (musicProvider.isCurrentlyPlaying(widget.songInfo.id)) {
      if (musicProvider.isPlaying) {
        musicProvider.pause();
      } else {
        musicProvider.play(musicProvider.playlist[0].preview);
      }
    } else {
      musicProvider.clearPlaylist();

      musicProvider.addSong(
          PlayedSong(id: widget.songInfo.id, preview: widget.songInfo.preview));
      musicProvider.play(musicProvider.playlist[0].preview);
      musicProvider.currentSongId = widget.songInfo.id;
    }
    musicProvider.musicCompleted();
  }

  @override
  Widget build(BuildContext context) {
    final musicProvider = Provider.of<MusicProvider>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButtonWidget(
            iconData: Icons.repeat,
            size: 20,
            color: AppColors.accent.color,
            onPressed: () {}),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: IconButtonWidget(
                  iconData: Icons.fast_rewind,
                  size: 20,
                  color: AppColors.white.color,
                  onPressed: () {
                    musicProvider.playPrevious();
                  }),
            ),
            const SizedBox(
              width: 10,
            ),
            Consumer<MusicProvider>(builder: (context, musicProvider, child) {
              return CreatePlayButton(
                  size: 40,
                  containerColor: AppColors.accent.color,
                  icon: musicProvider.isPlaying &&
                          musicProvider.isSongInPlaylist(widget.songInfo.id)
                      ? Icon(Icons.pause, color: AppColors.white.color)
                      : Icon(Icons.play_arrow, color: AppColors.white.color),
                  onPressed: () {
                    playPauseMusic(context, musicProvider);
                  });
            }),
            const SizedBox(
              width: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: IconButtonWidget(
                  iconData: Icons.fast_forward,
                  size: 20,
                  color: AppColors.white.color,
                  onPressed: () {
                    musicProvider.playNext();
                  }),
            ),
          ],
        ),
        IconButtonWidget(
            iconData: Icons.shuffle,
            size: 20,
            color: AppColors.accent.color,
            onPressed: () {}),
      ],
    );
  }
}
