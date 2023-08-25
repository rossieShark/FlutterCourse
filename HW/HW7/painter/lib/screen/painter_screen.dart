// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:painter/screen/painter.dart';

import '../widgets/button_widget.dart';
import '../widgets/color_picker.dart';
import '../widgets/inherited_widget.dart';
import '../widgets/line_width.dart';
import '../widgets/painter_widget.dart';

class DrawingScreen extends StatefulWidget {
  // final double containerWidth;
  // final double containerHeight;

  const DrawingScreen({
    super.key,
    // required this.containerWidth,
    // required this.containerHeight
  });

  @override
  _DrawingScreenState createState() => _DrawingScreenState();
}

class _DrawingScreenState extends State<DrawingScreen> {
  Color lineColor = const Color.fromARGB(255, 0, 0, 0);
  double lineWidth = 0.5;
  List<PathData> paths = [];
  List<PathData> deletedPathList = [];

  void updateLineColor(Color color) {
    setState(() {
      lineColor = color;
    });
  }

  void updateLineWidth(double width) {
    setState(() {
      lineWidth = width;
    });
  }

  void _undo() {
    setState(() {
      if (paths.isNotEmpty) {
        deletedPathList.add(paths.last);
        paths.removeLast();
      }
    });
  }

  void _redo() {
    setState(() {
      if (deletedPathList.isNotEmpty) {
        paths.add(deletedPathList.last);
        deletedPathList.removeLast();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<IconButtonWidget> buttonList = [
      IconButtonWidget(
          onPressed: () {
            _openColorPickerWidget(context);
          },
          iconData: CupertinoIcons.color_filter,
          color: Colors.white),
      IconButtonWidget(
          onPressed: () {
            _openLineWidthWidget(context);
          },
          iconData: Icons.line_weight,
          color: Colors.white),
      IconButtonWidget(
          onPressed: () {
            setState(() {
              lineColor = const Color.fromARGB(255, 30, 29, 29);
            });
          },
          iconData: Icons.square,
          color: Colors.white),
      IconButtonWidget(
          onPressed: () {
            setState(() {
              lineColor = const Color.fromARGB(255, 255, 255, 255);
            });
          },
          iconData: Icons.edit,
          color: Colors.white)
    ];
    List<String> buttonNames = ['Color', 'Thickness', 'Eraser', 'Brush'];

    return PathsData(
      paths: paths,
      onUndo: _undo,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 30, 29, 29),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 54, 53, 53),
          actions: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Painter(),
                            fullscreenDialog: true,
                          ),
                        );
                      }),
                  Row(
                    children: [
                      IconButtonWidget(
                          iconData: Icons.undo,
                          color: Colors.white,
                          onPressed: () {
                            _undo();
                            print('go back');
                          }),
                      IconButtonWidget(
                          iconData: Icons.redo,
                          color: Colors.white,
                          onPressed: () {
                            _redo();
                          }),
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          lineColor = Colors.transparent;
                        });
                        Navigator.pushReplacement(context, PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                          return Painter(
                            resultContainer: resultContainer(),
                            paths: paths,
                          );
                        }));
                      },
                      child: const Text(
                        'Apply',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(child: resultContainer()),
            Container(
              height: 90,
              color: const Color.fromARGB(255, 54, 53, 53),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  buttonList.length,
                  (index) {
                    double paddingLeft =
                        (MediaQuery.of(context).size.width - 50 * 4) / 8;
                    return Padding(
                      padding:
                          EdgeInsets.fromLTRB(paddingLeft, 8, paddingLeft, 0),
                      child: Column(
                        children: [
                          buttonList[index],
                          Text(
                            buttonNames[index],
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container resultContainer() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        color: Colors.transparent.withOpacity(0),
        child: PainterWidget(
          lineColor: lineColor,
          lineWidth: lineWidth,
        ));
  }

  void _openColorPickerWidget(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return LineColorChange(updateLineColor);
      },
    ).then((color) {
      if (color != null) {
        setState(() {
          lineColor = color;
        });
      }
    });
  }

  void _openLineWidthWidget(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return LineWidthChange(
          updateLineWidth,
          lineWidth: lineWidth,
        );
      },
    ).then((width) {
      setState(() {
        lineWidth = width;
      });
    });
  }
}
