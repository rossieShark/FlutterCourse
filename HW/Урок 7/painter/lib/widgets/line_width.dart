
import 'package:flutter/material.dart';

class LineWidthChange extends StatefulWidget {
  final Function(double) updateLineWidth;
  final double lineWidth;
  const LineWidthChange(this.updateLineWidth, {super.key, required this.lineWidth});
  @override
  // ignore: library_private_types_in_public_api
  _LineWidthChangeState createState() => _LineWidthChangeState();
}

class _LineWidthChangeState extends State<LineWidthChange> {
  late double _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue =
        widget.lineWidth; 
  }

  @override
  Widget build(BuildContext context) {
    const double minValue = 0;
   const  double maxValue = 10;
   const  int numberOfSteps = 100;
   
    return AlertDialog(
      title: const Text('Choose a width of line'),
      content: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Slider(
            activeColor: const Color.fromARGB(255, 54, 53, 53),
            thumbColor: const Color.fromARGB(255, 121, 9, 1),
            value: _currentValue,
            min: minValue,
            max: maxValue,
            divisions: numberOfSteps,
            onChanged: (value) {
              setState(() {
                _currentValue =
                    value; 
              });
            },
            onChangeEnd: (value) {
              widget.updateLineWidth(value);
              Navigator.of(context).pop(value); 
            },
          ),
        ]),
      ),
    );
  }
}
