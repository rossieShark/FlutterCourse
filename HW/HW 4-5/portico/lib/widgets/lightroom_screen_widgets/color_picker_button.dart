import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:portico/widgets/general_widgets/assest.dart';

import '../../main.dart';
import '../general_widgets/button_widget.dart';

class ColorPickerButton extends StatelessWidget {
  const ColorPickerButton({
    Key? key,
    required this.changeTextColor,
    required this.textColor,
  }) : super(key: key);

  final void Function(Color) changeTextColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextButtonWidget(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Choose a Color'),
                        const SizedBox(height: 16.0),
                        ColorPicker(
                          pickerColor: textColor,
                          onColorChanged: changeTextColor,
                          enableAlpha: false,
                          pickerAreaHeightPercent: 0.8,
                        ),
                        const SizedBox(height: 16.0),
                        TextButtonWidget(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(16.0),
                            backgroundColor: AppColorData.white,
                          ),
                          child: const Text(
                            'Apply',
                            style: TextStyle(color: AppColorData.darkRed),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(16.0),
            backgroundColor: Colors.black,
          ),
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              SizedBox(
                width: 20,
                height: 20,
                child: Image.asset(
                  Assets.pencil.asset,
                  color: AppColorData.white,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 10,
                width: 20,
                color: textColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
