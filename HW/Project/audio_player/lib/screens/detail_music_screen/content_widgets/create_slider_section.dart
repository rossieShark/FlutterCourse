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
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  String formatTime(int seconds) {
    return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
  }

  @override
  void initState() {
    super.initState();

    final musicProvider = Provider.of<MusicProvider>(context, listen: false);
    musicProvider.audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    musicProvider.audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });


  }

  @override
  Widget build(BuildContext context) {
    final musicProvider = Provider.of<MusicProvider>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(formatTime(position.inSeconds),
            style: TextStyle(
                fontFamily: AppFonts.colombia.font,
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: Colors.white)),
        SizedBox(
          width: widget.width,
          child: Slider(
            activeColor: const Color.fromARGB(255, 72, 72, 72),
            inactiveColor: AppColors.black.color,
            thumbColor: AppColors.accent.color,
            value: position.inSeconds.toDouble(),
            min: 0.0,
            max: duration.inSeconds.toDouble(),
            onChanged: (value) {
              setState(() {
                final position = Duration(seconds: value.toInt());
                musicProvider.audioPlayer.seek(position);
                musicProvider.audioPlayer.resume();
              });
            },
            onChangeEnd: (newValue) {},
          ),
        ),
        Text(formatTime((duration - position).inSeconds),
            style: TextStyle(
                fontFamily: AppFonts.colombia.font,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Colors.white))
      ],
    );
  }
}
