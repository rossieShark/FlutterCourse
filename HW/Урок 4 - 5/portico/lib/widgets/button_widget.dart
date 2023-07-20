import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final Text? text;
  final VoidCallback onPressed;
  final Color? color;
  final Image? image;
  final ButtonStyle? style;
  final EdgeInsets? padding;

  const TextButtonWidget(
      {super.key,
      required this.onPressed,
      this.text,
      this.color,
      this.image,
      this.style,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Theme.of(context).platform == TargetPlatform.iOS
        ? CupertinoButton(
            onPressed: onPressed,
            color: color,
            child: image != null ? image! : text!)
        : ElevatedButton(
            onPressed: onPressed,
            style: style,
            child: image != null ? image! : text!,
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
