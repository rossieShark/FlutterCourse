import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class CreateVolumeSlider extends StatelessWidget {
  const CreateVolumeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButtonWidget(
          onPressed: () {},
          iconData: Icons.volume_mute,
          size: 20,
          color: AppColors.accent.color,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.13,
          child: Slider(
            inactiveColor: Colors.grey,
            thumbColor: AppColors.accent.color,
            value: 0.5,
            min: 0.0,
            max: 1.0,
            onChanged: null,
          ),
        ),
      ],
    );
  }
}
