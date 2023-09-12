import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class CreateSliderSection extends StatefulWidget {
  final double width;
  const CreateSliderSection({super.key, required this.width});

  @override
  State<CreateSliderSection> createState() => _CreateSliderSectionState();
}

class _CreateSliderSectionState extends State<CreateSliderSection> {
  late double _sliderValue;
  late String _formattedDuration;
  late Duration _audioDuration;
  @override
  void initState() {
    super.initState();
    _formattedDuration = '00:00';
    _sliderValue = 0.0;
    _audioDuration = const Duration(seconds: 15);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(_formattedDuration,
            style: TextStyle(
                fontFamily: AppFonts.colombia.font,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
        SizedBox(
          width: widget.width,
          child: Slider(
            activeColor: const Color.fromARGB(255, 72, 72, 72),
            inactiveColor: AppColors.black.color,
            thumbColor: AppColors.accent.color,
            value: _sliderValue,
            min: 0.0,
            max: _audioDuration.inMilliseconds.toDouble(),
            onChanged: (newValue) {
              setState(() {
                setState(() {
                  _sliderValue = newValue;
                  _formattedDuration =
                      SliderFormatter().sliderValueFormatDuration(_sliderValue);
                });
              });
            },
            onChangeEnd: (newValue) {},
          ),
        ),
        Text(SliderFormatter().sliderFormatDuration(_audioDuration),
            style: TextStyle(
                fontFamily: AppFonts.colombia.font,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white))
      ],
    );
  }
}
