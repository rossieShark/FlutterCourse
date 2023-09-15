import 'package:project/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  final VoidCallback onPressed;
  final bool isFavorite;

  const LikeButton({
    super.key,
    required this.onPressed,
    required this.isFavorite,
  });

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 200),
    vsync: this,
    value: 1.0,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed();
        _controller.reverse().then((value) => _controller.forward());
      },
      child: ScaleTransition(
        scale: Tween(begin: 0.7, end: 1.0).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeOut),
        ),
        child: widget.isFavorite
            ? Icon(
                Icons.favorite,
                size: 20,
                color: AppColors.accent.color,
              )
            : Icon(
                Icons.favorite_border,
                color: AppColors.accent.color,
                size: 20,
              ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
