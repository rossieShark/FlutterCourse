import 'package:project/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class FavoriteFolder {
  Widget image;
  final String title;
  final IconButtonWidget iconButton;

  FavoriteFolder({
    this.image = const Icon(
      Icons.music_note,
      color: Colors.white,
    ),
    required this.title,
    required this.iconButton,
  });
}
