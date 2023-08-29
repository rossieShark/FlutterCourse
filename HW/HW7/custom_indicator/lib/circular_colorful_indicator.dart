import 'package:flutter/material.dart';

import 'curcles_painter.dart';

class CircularColorfulIndicator extends StatefulWidget {
  const CircularColorfulIndicator({super.key});

  @override
  CircularColorfulIndicatorState createState() =>
      CircularColorfulIndicatorState();
}

class CircularColorfulIndicatorState extends State<CircularColorfulIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
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
      appBar: AppBar(title: const Text('Circular Animation')),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              painter: CirclesPainter(_controller.value),
              size: const Size(200, 200),
            );
          },
        ),
      ),
    );
  }
}
