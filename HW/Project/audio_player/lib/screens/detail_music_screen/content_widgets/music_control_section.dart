import 'package:audio_player/databases/database.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter/material.dart';

class CreatMusicControlSection extends StatefulWidget {
  final DetailInfoSong songInfo;
  const CreatMusicControlSection({super.key, required this.songInfo});

  @override
  State<CreatMusicControlSection> createState() =>
      _CreatMusicControlSectionState();
}

class _CreatMusicControlSectionState extends State<CreatMusicControlSection> {
  bool isPlaying = false;
  AudioPlayer? currentAudioPlayer;
  AudioPlayer audioPlayer = AudioPlayer();

  void toggle() {
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void audioPlay() async {
    if (audioPlayer.playing) {
      await audioPlayer.pause();
      toggle();
    } else {
      if (currentAudioPlayer != null && currentAudioPlayer != audioPlayer) {
        await currentAudioPlayer!.pause();
      }

      // ignore: unused_local_variable
      final duration = await audioPlayer.setUrl(widget.songInfo.preview);
      await audioPlayer.play();
      toggle();
      currentAudioPlayer = audioPlayer;
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () {}),
            ),
            const SizedBox(
              width: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(color: AppColors.accent.color),
                child: IconButtonWidget(
                    iconData: isPlaying ? Icons.play_arrow : Icons.pause,
                    color: AppColors.white.color,
                    size: 45 / 2,
                    onPressed: () {
                      audioPlay();
                    }),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: IconButtonWidget(
                  iconData: Icons.fast_forward,
                  size: 20,
                  color: AppColors.white.color,
                  onPressed: () {}),
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
