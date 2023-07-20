import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final Text? text;
  final VoidCallback onPressed;
  final Color? color;
  final Image? image;
  final ButtonStyle? style;
  final EdgeInsets? padding;

  TextButtonWidget(
      {required this.onPressed,
      this.text,
      this.color,
      this.image,
      this.style,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Theme.of(context).platform == TargetPlatform.iOS
        ? CupertinoButton(
            child: image != null ? image! : text!,
            onPressed: onPressed,
            color: color)
        : ElevatedButton(
            child: image != null ? image! : text!,
            onPressed: onPressed,
            style: style,
          );
  }
}

class IconButtonWidget extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPressed;
  final Color? color;

  IconButtonWidget({
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
