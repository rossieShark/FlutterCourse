// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:painter/widgets/button_widget.dart';

import '../widgets/inherited_widget.dart';
import '../widgets/painter_widget.dart';
import 'painter_screen.dart';
import 'screen_size_change.dart';

class Painter extends StatefulWidget {
  final Widget? resultContainer;
  final List<PathData> paths;

  const Painter({
    key,
    this.paths = const [],
    this.resultContainer,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PainterState createState() => _PainterState();
}

class _PainterState extends State<Painter> {
  double containerWidth = 600;
  double containerHeight = 900;
  List<Widget> stackOfResultContainers = [];
  Widget? resultContainer;

  @override
  void initState() {
  
  
    super.initState();
    setState(() {
      if (widget.resultContainer != null) {
        stackOfResultContainers.add(widget.resultContainer!);
      }
    });
  }

  @override
  void didChangeDependencies() {
    containerWidth = MediaQuery.of(context).size.width;
    containerHeight = MediaQuery.of(context).size.width;
    super.didChangeDependencies();
  }

  void updateContainerDimensions(double width, double height) {
    setState(() {
      containerWidth = width;
      containerHeight = height;
    });
  }

  void _undo() {
    setState(() {
      if (stackOfResultContainers.isNotEmpty) {
        resultContainer = stackOfResultContainers.last;
        stackOfResultContainers.removeLast();
      }
    });
  }

  void _redo() {
    setState(() {
      if (resultContainer != null) {
        stackOfResultContainers.add(resultContainer!);
        resultContainer = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<IconButtonWidget> buttonList = [
      IconButtonWidget(
          onPressed: () {
            _openContainerSizePopup(context);
          },
          iconData: Icons.fit_screen,
          color: Colors.white),
      IconButtonWidget(
          onPressed: () {
            _openDrawingWidget(context);
          },
          iconData: Icons.draw,
          color: Colors.white),
      IconButtonWidget(
          onPressed: () {}, iconData: Icons.filter, color: Colors.white),
      IconButtonWidget(
          onPressed: () {}, iconData: Icons.text_fields, color: Colors.white),
      IconButtonWidget(
          onPressed: () {}, iconData: Icons.add_a_photo, color: Colors.white),
      IconButtonWidget(
          onPressed: () {}, iconData: Icons.filter_frames, color: Colors.white),
      IconButtonWidget(
          onPressed: () {}, iconData: Icons.crop, color: Colors.white),
    ];
    return PathsData(
      paths: widget.paths,
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
                  IconButtonWidget(
                      iconData: Icons.arrow_back_ios,
                      color: Colors.white,
                      onPressed: () {
                        print('go back');
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
                          onPressed: resultContainer != null
                              ? () {
                                  _redo();
                                  print('go back');
                                }
                              : null),
                      IconButtonWidget(
                          iconData: Icons.save_alt,
                          color: Colors.white,
                          onPressed: () {
                            print('save');
                          }),
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        print('nextStep');
                      },
                      child: const Text(
                        'Next',
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height - 250,
                color: const Color.fromARGB(255, 30, 29, 29),
              ),
              Positioned(
                bottom: 0,
                top: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    color: Colors.transparent,
                    width: containerWidth,
                    height: containerHeight,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                top: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: stackOfResultContainers.length,
                      itemBuilder: (context, index) {
                        return Center(child: stackOfResultContainers[index]);
                      }),
                ),
              ),
            ]),
            Container(
              height: 100,
              color: const Color.fromARGB(255, 54, 53, 53),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  buttonList.length,
                  (index) {
                    final padding = (MediaQuery.of(context).size.width -
                            buttonList.length * 45 -
                            16) /
                        (buttonList.length * 2);
                    return Padding(
                      padding: EdgeInsets.fromLTRB(padding, 8, padding, 8),
                      child: buttonList[index],
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

  void _openContainerSizePopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ContainerSizePopup(updateContainerDimensions);
      },
    );
  }

  void _openDrawingWidget(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const DrawingScreen(
            // containerHeight: containerHeight,
            // containerWidth: containerWidth,
            ),
        fullscreenDialog: true,
      ),
    );
  }
}
