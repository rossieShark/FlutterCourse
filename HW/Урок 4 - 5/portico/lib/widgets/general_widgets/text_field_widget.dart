import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class CustomTextField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final Icon? icon;
  final String placeholder;
  final EdgeInsets? padding;
  final BoxDecoration? boxDecoration;

  const CustomTextField({
    super.key,
    required this.onChanged,
    required this.placeholder,
    this.icon,
    this.padding,
    this.boxDecoration,
  });

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoTextField(
        prefix: icon,
        placeholder: placeholder,
        padding: padding ?? EdgeInsets.zero, // Use EdgeInsets.zero as default
        decoration: boxDecoration,
        onChanged: onChanged,
      );
    } else {
      return TextField(
        decoration: InputDecoration(
          prefixIcon: icon,
          hintText: placeholder,
          border: InputBorder.none,
        ),
        onChanged: onChanged,
      );
    }
  }
}
