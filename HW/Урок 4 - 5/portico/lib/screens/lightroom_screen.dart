// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:portico/main.dart';
import 'package:portico/widgets/button_widget.dart';
import 'package:portico/widgets/sized_box_widget.dart';

class LightroomScreen extends StatefulWidget {
  final String image;
  const LightroomScreen({Key? key, required this.image}) : super(key: key);

  @override
  LightroomScreenState createState() => LightroomScreenState();
}

class LightroomScreenState extends State<LightroomScreen> {
  late double _scale = 1.0;
  late double _previousScale = 1.0;
  late double _top = 0.0;
  late double _left = 0.0;
  late Offset _startOffset = Offset.zero;
  late double _boundaryLeft;
  late double _boundaryTop;
  late double _boundaryRight;
  late double _boundaryBottom;
  late double containerWidth;
  late double containerHeight;
  late double imageHeight = 0;
  late double imageWidth = 0;
  final double maxZoom = 1.2;
  var changedText = '';
  final TextEditingController _textEditingController = TextEditingController();
  late Widget changedContainer;
  int? selectedIndex;
  Color textColor = AppColorData.white;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initializeVariables();
  }

  void _initializeVariables() {
    bool isIpad = MediaQuery.of(context).size.width > 650;

    containerWidth = MediaQuery.of(context).size.width / 5 * 4;
    containerHeight = MediaQuery.of(context).size.height / 7 * 3;

    imageHeight = isIpad
        ? MediaQuery.of(context).size.height / 3.5
        : MediaQuery.of(context).size.height / 4;
    imageWidth = isIpad
        ? MediaQuery.of(context).size.width / 3.2
        : MediaQuery.of(context).size.width / 2.3;

    _boundaryLeft = -(containerWidth - imageWidth * _scale) / 2;
    _boundaryTop = -(containerHeight - imageHeight * _scale) / 2;
    _boundaryRight = -_boundaryLeft;
    _boundaryBottom = -_boundaryTop;

    changedContainer = _buildColorFilteredContainer(0);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _onScaleStart(ScaleStartDetails details) {
    _previousScale = _scale;
    _startOffset = details.focalPoint;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    final currentPosition = details.focalPoint;
    final deltaScale = details.scale - 1.0;
    final deltaPosition = currentPosition - _startOffset;

    setState(() {
      _scale = _previousScale + deltaScale;
      double newLeft = _left + deltaPosition.dx;
      double newTop = _top + deltaPosition.dy;

      // Limit the new position within the boundaries of the container
      newLeft = newLeft.clamp(_boundaryLeft, _boundaryRight);
      newTop = newTop.clamp(_boundaryTop, _boundaryBottom);

      _left = newLeft;
      _top = newTop;

      // Limit the _scale to the maxZoom value
      _scale = _scale.clamp(1.0, maxZoom);
    });

    _startOffset = currentPosition;
  }

  void _resetScaleAndPosition() {
    setState(() {
      _scale = 1.0;
      _left = 0.0;
      _top = 0.0;
    });
  }

  void _changeTextColor(Color color) {
    setState(() {
      textColor = color;
    });
  }

  void _changeFilter(int index) {
    setState(() {
      selectedIndex = index;
      changedContainer = _buildColorFilteredContainer(index);
    });
  }

  Widget _buildColorFilteredContainer(int index) {
    return SizedBox(
      child: Stack(
        children: [
          index == 0
              ? Image.asset(
                  widget.image,
                  height: imageHeight,
                  width: imageWidth,
                  fit: BoxFit.cover,
                )
              : ColorFiltered(
                  colorFilter: colorFilters[index]!,
                  child: Image.asset(
                    widget.image,
                    height: imageHeight,
                    width: imageWidth,
                    fit: BoxFit.cover,
                  ),
                ),
          Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0,
            child: SizedBox(
              height: imageHeight,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  changedText,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 20,
                    fontFamily: AppFonts.cormorant.font,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isCupertino = Theme.of(context).platform == TargetPlatform.iOS;

    return Scaffold(
      backgroundColor: AppColorData.white,
      appBar: AppBar(
        title: const Text(''),
        actions: [
          IconButtonWidget(
              iconData: CupertinoIcons.share,
              color: Colors.black,
              onPressed: () {
                print('share button pressed');
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomSizedBox(iPadheight: 50, phoneHeight: 20),
            GestureDetector(
              onScaleStart: _onScaleStart,
              onScaleUpdate: _onScaleUpdate,
              onDoubleTap: _resetScaleAndPosition,
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      width: containerWidth,
                      height: containerHeight,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 3.0),
                        color: AppColorData.white,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Center(
                      child: Transform.scale(
                        scale: _scale,
                        child: Transform.translate(
                          offset: Offset(_left, _top),
                          child: changedContainer,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const CustomSizedBox(iPadheight: 50, phoneHeight: 20),
            Column(
              children: [
                SizedBox(
                  height: mediaQuery.size.height / 4.8,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: colorFilters.length,
                    itemBuilder: (context, index) {
                      final double imageHeight = mediaQuery.size.height / 5;
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
                        child: GestureDetector(
                          onTap: () {
                            _changeFilter(index);
                          },
                          child: RetouchImageList(
                              imageHeight: imageHeight,
                              selectedIndex: selectedIndex,
                              index: index),
                        ),
                      );
                    },
                  ),
                ),
                const CustomSizedBox(iPadheight: 50, phoneHeight: 20),
                Row(children: [
                  Expanded(
                    child: Container(
                      height: mediaQuery.size.height / 25,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _textEditingController,
                        style: TextStyle(
                          color: textColor,
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Enter the text',
                          labelStyle: TextStyle(
                              color: AppColorData.lightGrey,
                              fontWeight: FontWeight.w400),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColorData.darkGrey)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColorData.darkRed,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            changedText = value;
                          });
                          print('Entered text: $value');
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                    child: isCupertino
                        ? Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: CupertinoButton(
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
                                              onColorChanged: _changeTextColor,
                                              enableAlpha: false,
                                              pickerAreaHeightPercent: 0.8,
                                            ),
                                            const SizedBox(height: 16.0),
                                            CupertinoButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                'Apply',
                                                style: TextStyle(
                                                    color:
                                                        AppColorData.darkRed),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              padding: const EdgeInsets.all(16.0),
                              child:
                                  ChooseColorButtonText(textColor: textColor),
                            ),
                          )
                        : ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Choose a Color',
                                      style: TextStyle(
                                          fontFamily: AppFonts.asteria.font,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 25),
                                    ),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ColorPicker(
                                            pickerColor: textColor,
                                            onColorChanged: _changeTextColor,
                                            enableAlpha: false,
                                            pickerAreaHeightPercent: 0.8,
                                          ),
                                          const SizedBox(height: 16.0),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              backgroundColor:
                                                  AppColorData.white,
                                            ),
                                            child: Text(
                                              'Apply',
                                              style: TextStyle(
                                                  color: AppColorData.darkRed,
                                                  fontFamily:
                                                      AppFonts.cormorant.font,
                                                  fontWeight: FontWeight.bold),
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
                            child: ChooseColorButtonText(textColor: textColor),
                          ),
                  ),
                ]),
                const SizedBox(height: 40),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ChooseColorButtonText extends StatelessWidget {
  const ChooseColorButtonText({
    Key? key,
    required this.textColor,
  }) : super(key: key);

  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: Image.asset(
            'assets/images/pencil.png',
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
    );
  }
}

class RetouchImageList extends StatelessWidget {
  const RetouchImageList({
    Key? key,
    required this.imageHeight,
    required this.selectedIndex,
    required this.index,
  }) : super(key: key);

  final double imageHeight;
  final int? selectedIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (index == 0)
          SizedBox(
            height: imageHeight,
            child: Image.asset(
              'assets/images/Retouch.JPG',
              fit: BoxFit.cover,
            ),
          )
        else
          ColorFiltered(
            colorFilter: colorFilters[index]!,
            child: SizedBox(
              height: imageHeight,
              child: Image.asset(
                'assets/images/Retouch.JPG',
                fit: BoxFit.cover,
              ),
            ),
          ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: Container(
            width: double.infinity,
            height: imageHeight,
            decoration: BoxDecoration(
              color: selectedIndex == index
                  ? Colors.black.withOpacity(0.5)
                  : Colors.transparent,
            ),
            child: Center(
              child: Text(
                filterName[index],
                style: TextStyle(
                    color: selectedIndex == index
                        ? AppColorData.white
                        : Colors.transparent,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppFonts.cormorant.font),
              ),
            ),
          ),
        )
      ],
    );
  }
}

const List<ColorFilter?> colorFilters = [
  null,
  ColorFilter.mode(Colors.grey, BlendMode.saturation),
  ColorFilter.mode(Color.fromARGB(255, 87, 6, 6), BlendMode.color),
  ColorFilter.mode(Colors.white, BlendMode.softLight),
  ColorFilter.mode(Color.fromARGB(255, 23, 66, 4), BlendMode.screen),
  ColorFilter.mode(Color.fromARGB(255, 117, 9, 54), BlendMode.softLight),
  ColorFilter.mode(Color.fromARGB(255, 39, 8, 130), BlendMode.screen),
  ColorFilter.mode(Color.fromARGB(255, 200, 128, 40), BlendMode.dst),
  ColorFilter.mode(Color.fromARGB(255, 20, 86, 10), BlendMode.softLight),
  ColorFilter.mode(Color.fromARGB(255, 234, 239, 123), BlendMode.softLight),
  ColorFilter.mode(Color.fromARGB(255, 5, 33, 171), BlendMode.difference),
  ColorFilter.mode(Color.fromARGB(255, 50, 50, 50), BlendMode.colorDodge),
  ColorFilter.mode(Color.fromARGB(255, 107, 62, 6), BlendMode.color),
  ColorFilter.mode(Color.fromARGB(255, 210, 9, 9), BlendMode.exclusion),
];

const List<String> filterName = [
  'None',
  'B&W',
  'Red',
  'Soft',
  'VNYL3',
  '1991',
  '1993',
  'Dodger',
  'Sun1',
  'Sun2',
  'Cross',
  'Dark',
  'Film',
  'EXCL'
];
