// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'inherited_widget.dart';

class PainterWidget extends StatefulWidget {
  final Color lineColor;
  final double lineWidth;

  const PainterWidget(
      {super.key, required this.lineColor, required this.lineWidth});

  @override
  _PainterWidgetState createState() => _PainterWidgetState();
}

class _PainterWidgetState extends State<PainterWidget> {
  void _startPath(Offset startPos) {
    final pathsData = PathsData.of(context);
    if (pathsData != null) {
      setState(() {
        pathsData.paths.add(
          PathData(
            points: [startPos],
            color: widget.lineColor,
            thickness: widget.lineWidth,
          ),
        );
      });
    }
  }

  void _updatePath(Offset newPos) {
    final pathsData = PathsData.of(context);
    if (pathsData != null && pathsData.paths.isNotEmpty) {
      setState(() {
        pathsData.paths.last.points.add(newPos);
      });
    }
  }

  void _endPath() {
    final pathsData = PathsData.of(context);
    if (pathsData != null && pathsData.paths.isNotEmpty) {
      setState(() {
        pathsData.paths.last.points.add(null);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final pathsData = PathsData.of(context);
    final List<PathData> paths = pathsData?.paths ?? [];
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onPanStart: (details) {
          RenderBox renderBox = context.findRenderObject() as RenderBox;
          _startPath(renderBox.globalToLocal(details.globalPosition));
        },
        onPanUpdate: (details) {
          RenderBox renderBox = context.findRenderObject() as RenderBox;
          _updatePath(renderBox.globalToLocal(details.globalPosition));
        },
        onPanEnd: (details) {
          _endPath();
        },
        child: CustomPaint(
          painter: DrawingPainter(paths),
          size: Size.infinite,
        ),
      ),
    );
  }
}

class DrawingPainter extends CustomPainter {
  final List<PathData> paths;

  DrawingPainter(this.paths);

  @override
  void paint(Canvas canvas, Size size) {
    for (var pathData in paths) {
      final path = Path();
      final paint = Paint()
        ..color = pathData.color
        ..strokeCap = StrokeCap.round
        ..strokeWidth = pathData.thickness;

      for (int i = 0; i < pathData.points.length - 1; i++) {
        if (pathData.points[i] != null && pathData.points[i + 1] != null) {
          path.moveTo(pathData.points[i]!.dx, pathData.points[i]!.dy);
          canvas.drawLine(pathData.points[i]!, pathData.points[i + 1]!, paint);
        } else if (pathData.points[i] != null &&
            pathData.points[i + 1] == null) {
          path.lineTo(pathData.points[i]!.dx, pathData.points[i]!.dy);
        }
      }
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class PathData {
  List<Offset?> points;
  Color color;
  double thickness;

  PathData(
      {required this.points, required this.color, required this.thickness});
}
