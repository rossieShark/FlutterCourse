import 'package:flutter/material.dart';

import 'ui_properties.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const CustomButton(
      {super.key, required this.onPressed, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
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
