import 'package:flutter/material.dart';
import 'dart:math' as math;

class Confetti extends StatelessWidget {
  const Confetti({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 45,
      height: 45,
      child: Center(
        child: Stack(
          children: [
            PositionedImage(index: 0, total: 5),
            PositionedImage(index: 1, total: 5),
            PositionedImage(index: 2, total: 5),
            PositionedImage(index: 3, total: 5),
            PositionedImage(index: 4, total: 5),
          ],
        ),
      ),
    );
  }
}

class PositionedImage extends StatelessWidget {
  final int index;
  final int total;
  static const double radius = 18;

  const PositionedImage({super.key, required this.index, required this.total});

  @override
  Widget build(BuildContext context) {
    double angle = 2 * math.pi * (index) / total;
    double x = radius * math.cos(angle);
    double y = radius * math.sin(angle);

    return Positioned(
      left: 20 + x,
      top: 20 + y,
      child: Transform.rotate(
        angle: angle,
        child: Image.asset(
          'assert/images/confetti.png',
          width: 5,
          height: 5,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
