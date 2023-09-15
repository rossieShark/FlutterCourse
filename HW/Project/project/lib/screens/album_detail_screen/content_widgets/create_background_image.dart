import 'package:flutter/material.dart';

class CreateBackgroundImage extends StatelessWidget {
  final String imageUrl;
  final double height;

  const CreateBackgroundImage({
    super.key,
    required this.imageUrl,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/black.jpg',
          fit: BoxFit.fill,
          width: double.infinity,
          height: height,
        ),
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                const Color.fromARGB(255, 255, 255, 255),
                Colors.white.withOpacity(0),
              ],
              tileMode: TileMode.decal,
            ).createShader(bounds);
          },
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: height,
          ),
        ),
      ],
    );
  }
}
