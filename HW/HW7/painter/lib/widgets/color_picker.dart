// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:painter/widgets/button_widget.dart';

class LineColorChange extends StatelessWidget {
  final Function(Color) updateLineColor;
  LineColorChange(this.updateLineColor, {super.key});

  Color lineColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: const Text(
        'Choose a Color',
        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 25),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ColorPicker(
              pickerColor: lineColor,
              onColorChanged: (color) => lineColor = color,
              enableAlpha: false,
              pickerAreaHeightPercent: 0.8,
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 50,
              width: 100,
              child: TextButtonWidget(
                onPressed: () {
                  Navigator.of(context).pop(lineColor);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  backgroundColor: Colors.white,
                ),
                child: const Text(
                  'Apply',
                  style: TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
