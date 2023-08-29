import 'package:flutter/material.dart';

class ChasingDots extends StatefulWidget {
  final int numberOfDots;
  const ChasingDots({Key? key, this.numberOfDots = 5}) : super(key: key);
  @override
  ChasingDotsState createState() => ChasingDotsState();
}

class ChasingDotsState extends State<ChasingDots>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  List<Animation<double>> _animations = [];
  final int _animationDuration = 1100;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: _animationDuration),
    )..repeat();
    _initAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _initAnimation() {
    double endAnimation = 1.0 / widget.numberOfDots;

    _animations = List.generate(
      widget.numberOfDots,
      (index) {
        return TweenSequence<double>([
          TweenSequenceItem<double>(
            tween: Tween<double>(begin: 15, end: 0),
            weight: 1,
          ),
          TweenSequenceItem<double>(
            tween: Tween<double>(begin: 0, end: 15),
            weight: 1,
          ),
        ]).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(index * endAnimation, (index + 1) * endAnimation),
          ),
        );
      },
    ).toList();
  }

  final List<Color> _colors = [
    const Color.fromARGB(255, 248, 188, 7),
    const Color.fromARGB(255, 244, 162, 54),
    const Color.fromARGB(255, 244, 138, 8),
    const Color.fromARGB(255, 235, 91, 7),
    const Color.fromARGB(255, 237, 76, 2),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.numberOfDots, (index) {
            return AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                final animation = _animations[index];
                return Container(
                  padding: const EdgeInsets.all(2.5),
                  child: Transform.translate(
                    offset: Offset(0, animation.value),
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: _colors[index]),
                      height: 10,
                      width: 10,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
