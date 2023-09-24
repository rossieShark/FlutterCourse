import 'package:audio_player/widgets/ui_properties.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final double width;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    double? width,
  })  : width = width ?? 180,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppColors.accent.color,
              const Color.fromARGB(255, 113, 21, 71),
            ],
          )),
      child: TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: TextStyle(
                color: AppColors.white.color,
                fontSize: 12,
                fontWeight: FontWeight.w400),
          )),
    );
  }
}
