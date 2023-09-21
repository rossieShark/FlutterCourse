import 'dart:async';

import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class CreateSliderSection extends StatefulWidget {
  final double width;

  const CreateSliderSection({super.key, required this.width});

  @override
  State<CreateSliderSection> createState() => _CreateSliderSectionState();
}

class _CreateSliderSectionState extends State<CreateSliderSection> {
  Duration duration = const Duration(seconds: 30);
  Duration position = Duration.zero;
  StreamSubscription<Duration>? durationSubscription;
  StreamSubscription<Duration>? positionSubscription;
  String formatTime(int seconds) {
    final int minutes = (seconds / 60).floor();
    final int remainingSeconds = seconds % 60;
    final String formattedMinutes = minutes.toString().padLeft(2, '0');
    final String formattedSeconds = remainingSeconds.toString().padLeft(2, '0');
    return '$formattedMinutes:$formattedSeconds';
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    durationSubscription?.cancel();
    positionSubscription?.cancel();

    final musicProvider = Provider.of<MusicProvider>(context, listen: false);
    // durationSubscription =
    //     musicProvider.audioPlayer.onDurationChanged.listen((newDuration) {
    //   setState(() {
    //     duration = newDuration;
    //   });
    // });

    positionSubscription =
        musicProvider.audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  void dispose() {
    durationSubscription?.cancel();
    positionSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final musicProvider = Provider.of<MusicProvider>(context, listen: false);
    final maxDuration = duration.inSeconds.toDouble();
    final currentPosition = position.inSeconds.toDouble();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(formatTime(position.inSeconds),
            style: TextStyle(
                fontFamily: AppFonts.lusitana.font,
                fontSize: 13,
                fontWeight: FontWeight.w100,
                color: Colors.white)),
        SizedBox(
          width: widget.width,
          child: Slider(
            activeColor: const Color.fromARGB(255, 72, 72, 72),
            inactiveColor: AppColors.black.color,
            thumbColor: AppColors.accent.color,
            value: currentPosition,
            min: 0.0,
            max: maxDuration,
            onChanged: (value) {
              final newPosition = Duration(seconds: value.toInt());
              setState(() {
                position = newPosition;
              });
              musicProvider.audioPlayer.seek(newPosition);
              musicProvider.audioPlayer.resume();
            },
            onChangeEnd: (newValue) {},
          ),
        ),
        Text(formatTime((duration - position).inSeconds),
            style: TextStyle(
                fontFamily: AppFonts.lusitana.font,
                fontSize: 13,
                fontWeight: FontWeight.w100,
                color: Colors.white))
      ],
    );
  }
}
