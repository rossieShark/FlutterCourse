import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class CreatSliderSection extends StatefulWidget {
  const CreatSliderSection({super.key});

  @override
  State<CreatSliderSection> createState() => _CreatSliderSectionState();
}

class _CreatSliderSectionState extends State<CreatSliderSection> {
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
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Slider(
            activeColor: AppColors.white.color,
            inactiveColor: AppColors.accent.color,
            thumbColor: AppColors.darkAccent.color,
            value: _sliderValue,
            min: 0.0,
            max: _audioDuration.inMilliseconds.toDouble(),
            onChanged: (newValue) {
              setState(() {
                setState(() {
                  _sliderValue = newValue;
                  _formattedDuration = sliderValueFormatDuration(_sliderValue);
                });
              });
            },
            onChangeEnd: (newValue) {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_formattedDuration,
                  style: Theme.of(context).textTheme.bodySmall),
              Text(sliderFormatDuration(_audioDuration),
                  style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ],
    );
  }
}
