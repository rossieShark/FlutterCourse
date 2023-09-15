import 'package:project/models/models.dart';
import 'package:project/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class DismissibleWidget extends StatelessWidget {
  const DismissibleWidget(
      {super.key,
      required this.song,
      required this.onDismissed,
      required this.child});

  final SongModel song;
  final VoidCallback onDismissed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: Key(song.id),
        direction: DismissDirection.endToStart,
        background: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          color: AppColors.accent.color,
          child: const Icon(Icons.delete, color: Colors.white),
        ),
        onDismissed: (direction) {
          onDismissed;
        },
        child: child);
  }
}
