import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final Widget? child;
  final VoidCallback onPressed;
  final Color? color;

  final ButtonStyle? style;
  final EdgeInsets? padding;

  const TextButtonWidget(
      {super.key,
      required this.onPressed,
      this.child,
      this.color,
      this.style,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Theme.of(context).platform == TargetPlatform.iOS
        ? CupertinoButton(onPressed: onPressed, color: color, child: child!)
        : ElevatedButton(
            onPressed: onPressed,
            style: style,
            child: child,
          );
  }
}

class IconButtonWidget extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPressed;
  final Color? color;

  const IconButtonWidget({
    super.key,
    required this.iconData,
    required this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        iconData,
        color: color,
      ),
      onPressed: onPressed,
      padding: EdgeInsets.zero,
    );
  }
}
