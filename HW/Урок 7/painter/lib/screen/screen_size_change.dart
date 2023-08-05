// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class ContainerSizePopup extends StatefulWidget {
  final Function(double, double) updateContainerDimensions;

  const ContainerSizePopup(this.updateContainerDimensions, {super.key});

  @override
  _ContainerSizePopupState createState() => _ContainerSizePopupState();
}

class _ContainerSizePopupState extends State<ContainerSizePopup> {
  final TextEditingController widthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Enter Container Size'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: widthController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Width'),
          ),
          TextField(
            controller: heightController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Height'),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the popup
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
      
            double width = double.tryParse(widthController.text) ?? 600;
            double height = double.tryParse(heightController.text) ?? 600;

           
            widget.updateContainerDimensions(width, height);

            Navigator.of(context).pop(); // Close the popup
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
