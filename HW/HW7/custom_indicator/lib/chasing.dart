import 'package:flutter/material.dart';

class DotWidget extends StatelessWidget {
  const DotWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: const Color.fromARGB(255, 158, 7, 7)),
      height: 10,
      width: 10,
    );
  }
}

class JumpingDots extends StatefulWidget {
  final int numberOfDots;
  const JumpingDots({Key? key, this.numberOfDots = 5}) : super(key: key);
  @override
  _JumpingDotsState createState() => _JumpingDotsState();
}

class _JumpingDotsState extends State<JumpingDots>
    with TickerProviderStateMixin {
  late List<AnimationController> _animationControllers;
  List<Animation<double>> _animations = [];
  int animationDuration = 200;

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  @override
  void dispose() {
    for (var controller in _animationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _initAnimation() {
    _animationControllers = List.generate(
      widget.numberOfDots,
      (index) {
        return AnimationController(
          vsync: this,
          duration: Duration(milliseconds: animationDuration),
        );
      },
    ).toList();

    for (int i = 0; i < widget.numberOfDots; i++) {
      _animations.add(
        Tween<double>(begin: 0, end: -20).animate(_animationControllers[i]),
      );
    }

    for (int i = 0; i < widget.numberOfDots; i++) {
      _animationControllers[i].addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationControllers[i].reverse();
          if (i != widget.numberOfDots - 1) {
            _animationControllers[i + 1].forward();
          }
        }
        if (i == widget.numberOfDots - 1 &&
            status == AnimationStatus.dismissed) {
          _animationControllers[0].forward();
        }
      });
    }

    _animationControllers.first.forward();
  }

  final List<Color> _colors = [
    Color.fromARGB(255, 248, 188, 7),
    const Color.fromARGB(255, 244, 162, 54),
    Color.fromARGB(255, 244, 138, 8),
    Color.fromARGB(255, 235, 91, 7),
    Color.fromARGB(255, 237, 76, 2),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.numberOfDots, (index) {
            return AnimatedBuilder(
              animation: _animationControllers[index],
              builder: (context, child) {
                return Container(
                  padding: EdgeInsets.all(2.5),
                  child: Transform.translate(
                    offset: Offset(0, _animations[index].value),
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
