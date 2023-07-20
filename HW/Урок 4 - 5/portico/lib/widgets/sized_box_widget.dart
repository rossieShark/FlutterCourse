import 'package:flutter/material.dart';

class CustomSizedBox extends StatelessWidget {
  final double iPadheight;
  final double phoneHeight;

  CustomSizedBox({required this.iPadheight, this.phoneHeight = 0});

  @override
  Widget build(BuildContext context) {
    final isIpad = MediaQuery.of(context).size.width > 600;
    return SizedBox(height: isIpad ? iPadheight : phoneHeight);
  }
}
