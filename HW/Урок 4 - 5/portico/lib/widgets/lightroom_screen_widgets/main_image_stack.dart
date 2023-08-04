import 'package:flutter/material.dart';
import 'package:portico/main.dart';

import '../../screens/lightroom_screen.dart';

class MainImageStack extends StatefulWidget {
  const MainImageStack({
    Key? key,
    required this.selectedIndex,
    required this.widget,
    required this.changedText,
    required this.textColor,
  }) : super(key: key);

  final int? selectedIndex;
  final LightroomScreen widget;

  final String changedText;
  final Color textColor;

  @override
  // ignore: library_private_types_in_public_api
  _MainImageStackState createState() => _MainImageStackState();
}

class _MainImageStackState extends State<MainImageStack> {
  late double _zoom = 1.0;
  late double _previousScale = 1.0;
  late double _offsetX = 0.0;
  late double _offsetY = 0.0;
  late Offset _startOffset = Offset.zero;
  late double _boundaryLeft;
  late double _boundaryTop;
  late double imageHeight = 0;
  late double imageWidth = 0;
  late double _boundaryRight;
  late double _boundaryBottom;
  late double containerWidth;
  late double containerHeight;

  final double maxZoom = 1.2;

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

    _boundaryLeft = -(containerWidth - imageWidth * _zoom) / 2;
    _boundaryTop = -(containerHeight - imageHeight * _zoom) / 2;
    _boundaryRight = -_boundaryLeft;
    _boundaryBottom = -_boundaryTop;
  }

  void _onScaleStart(ScaleStartDetails details) {
    _previousScale = _zoom;
    _startOffset = details.focalPoint;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    final currentPosition = details.focalPoint;
    final deltaScale = details.scale - 1.0;
    final deltaPosition = currentPosition - _startOffset;

    setState(() {
      _zoom = _previousScale + deltaScale;
      double newLeft = _offsetY + deltaPosition.dx;
      double newTop = _offsetX + deltaPosition.dy;

      // Limit the new position within the boundaries of the container
      newLeft = newLeft.clamp(_boundaryLeft, _boundaryRight);
      newTop = newTop.clamp(_boundaryTop, _boundaryBottom);

      _offsetY = newLeft;
      _offsetX = newTop;

      // Limit the _scale to the maxZoom value
      _zoom = _zoom.clamp(1.0, maxZoom);
    });

    _startOffset = currentPosition;
  }

  void _resetScaleAndPosition() {
    setState(() {
      _zoom = 1.0;
      _offsetY = 0.0;
      _offsetX = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                scale: _zoom,
                child: Transform.translate(
                  offset: Offset(_offsetY, _offsetX),
                  child: Stack(
                    children: [
                      ColorFiltered(
                        colorFilter: colorFilters[widget.selectedIndex ?? 1]!,
                        child: Image.asset(
                          widget.widget.image,
                          height: imageHeight,
                          width: imageWidth,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 10,
                        child: Center(
                          child: Text(
                            widget.changedText,
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: 20,
                              fontFamily: AppFonts.cormorant.font,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
