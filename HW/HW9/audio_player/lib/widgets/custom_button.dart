import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onPressed;
  final Color? color;

  final ButtonStyle? style;

  const TextButtonWidget({
    super.key,
    required this.onPressed,
    this.child,
    this.color,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Theme.of(context).platform == TargetPlatform.iOS
        ? CupertinoButton(
            onPressed: onPressed,
            color: color,
            child: child!,
          )
        : ElevatedButton(
            onPressed: onPressed, style: style, child: Center(child: child!));
  }
}

class IconButtonWidget extends StatelessWidget {
  final IconData iconData;
  final VoidCallback? onPressed;
  final Color? color;
  final double? size;

  const IconButtonWidget({
    super.key,
    required this.iconData,
    required this.onPressed,
    this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        iconData,
        size: size,
        color: color,
      ),
      onPressed: onPressed,
      padding: EdgeInsets.zero,
    );
  }
}

class LikeButton extends StatefulWidget {
  final bool isFavorite;
  final VoidCallback onPressed;
  final Color color;

  const LikeButton(
      {super.key,
      required this.isFavorite,
      required this.onPressed,
      required this.color});

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
        widget.onPressed(); // Call the provided onPressed function
        _controller.reverse().then((value) => _controller.forward());
      },
      child: ScaleTransition(
        scale: Tween(begin: 0.7, end: 1.0).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeOut),
        ),
        child: widget.isFavorite
            ? Icon(
                Icons.favorite,
                size: 25,
                color: widget.color, // Customize the color as needed
              )
            : Icon(
                Icons.favorite_border,
                color: widget.color,
                size: 25,
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
