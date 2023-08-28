import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class CustomAnimatedContainer extends StatelessWidget {
  const CustomAnimatedContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(45),
      child: AnimateGradient(
        primaryBegin: Alignment.topLeft,
        primaryEnd: Alignment.bottomLeft,
        secondaryBegin: Alignment.bottomLeft,
        secondaryEnd: Alignment.topRight,
        primaryColors: const [
          Color.fromARGB(255, 156, 14, 80),
          Color.fromARGB(255, 129, 24, 59),
          Color.fromARGB(255, 138, 46, 77),
        ],
        secondaryColors: const [
          Color.fromARGB(255, 156, 90, 112),
          Color.fromARGB(255, 238, 220, 231),
          Color.fromARGB(255, 176, 70, 119),
        ],
        child: Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.home_rounded, color: AppColors.white.color),
          ),
        ),
      ),
    );
  }
}
