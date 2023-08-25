import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final Text? text;
  final VoidCallback onPressed;
  final Color? color;

  final ButtonStyle? style;

  const TextButtonWidget({
    super.key,
    required this.onPressed,
    this.text,
    this.color,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Theme.of(context).platform == TargetPlatform.iOS
        ? CupertinoButton(onPressed: onPressed, color: color, child: text!)
        : ElevatedButton(
            onPressed: onPressed, style: style, child: Center(child: text!));
  }
}

class IconButtonWidget extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPressed;
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
