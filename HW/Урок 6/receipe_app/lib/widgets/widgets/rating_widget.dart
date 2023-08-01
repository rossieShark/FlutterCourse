import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final Color color;
  final double size;

  const StarRating({
    super.key,
    required this.starCount,
    required this.rating,
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(starCount, (index) {
        bool isFullStar = index < rating;
        return Icon(
          isFullStar ? Icons.star : Icons.star_border,
          size: size,
          color: isFullStar ? color : const Color.fromARGB(255, 235, 235, 235),
        );
      }),
    );
  }
}
