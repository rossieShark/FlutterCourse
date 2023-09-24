import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
// import 'package:volume_controller/volume_controller.dart';

class CreateVolumeSlider extends StatefulWidget {
  const CreateVolumeSlider({super.key});

  @override
  State<CreateVolumeSlider> createState() => _CreateVolumeSliderState();
}

class _CreateVolumeSliderState extends State<CreateVolumeSlider> {
  // double _volumeListenerValue = 0;
  // double _getVolume = 0;
  // double _setVolumeValue = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   // Listen to system volume change
  //   VolumeController().listener((volume) {
  //     setState(() => _volumeListenerValue = volume);
  //   });

  //   // Get the initial volume level
  //   VolumeController().getVolume().then((volume) {
  //     setState(() {
  //       _setVolumeValue = volume;
  //     });
  //   });
  // }

  // @override
  // void dispose() {
  //   VolumeController().removeListener();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButtonWidget(
          onPressed: () {},
          iconData: Icons.volume_up,
          size: 20,
          color: AppColors.accent.color,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.13,
          child: Slider(
            inactiveColor: AppColors.black.color,
            activeColor: const Color.fromARGB(255, 85, 85, 85),
            thumbColor: AppColors.accent.color,
            min: 0.0,
            max: 1.0,
            onChanged: (double value) async {
              // setState(() {
              //   _setVolumeValue = value;
              //   VolumeController().setVolume(_setVolumeValue);
              // });
            },
            value: 0.5,
          ),
        ),
      ],
    );
  }
}
