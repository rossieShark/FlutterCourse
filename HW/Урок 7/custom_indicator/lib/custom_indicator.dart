import 'package:flutter/material.dart';

import 'my_painter.dart';

class CircularAnimation extends StatefulWidget {
  @override
  _CircularAnimationState createState() => _CircularAnimationState();
}

class _CircularAnimationState extends State<CircularAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Circular Animation')),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              painter: CircularPainter(_controller.value),
              size: Size(200, 200),
            );
          },
        ),
      ),
    );
  }
}
