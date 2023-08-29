import 'package:clapping/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:math' as math;

class Clapping extends StatefulWidget {
  const Clapping({super.key});

  @override
  State<Clapping> createState() => _ClappingState();
}

class _ClappingState extends State<Clapping> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late AnimationController _confettiController;
  late Animation<double> _animation;
  late Animation<double> _containerAnimation;
  late Animation<double> _fadeAnimation;
  bool _isrotated = true;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _confettiController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -10),
    ).animate(_controller);

    _animation = CurvedAnimation(
      parent: _confettiController,
      curve: Curves.linear,
    ).drive(Tween<double>(begin: 1.0, end: 3));

    _containerAnimation = CurvedAnimation(
      parent: _confettiController,
      curve: Curves.easeOutExpo,
    ).drive(Tween<double>(begin: 1.0, end: 1.1));

    _confettiController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _confettiController.reset(); // Reset instead of reverse
      }
    });
    _fadeAnimation = CurvedAnimation(
      parent: _confettiController,
      curve: Curves.easeInQuad,
    ).drive(Tween<double>(begin: 1.0, end: 0.3));
  }

  void _toggle() {
    setState(() {
      _isrotated = !_isrotated;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _confettiController.dispose();
    super.dispose();
  }

  void _handleAnimation() {
    if (_counter == 10) {
      _controller.forward();
    } else if (_counter == 0) {
      _controller.reset();
    } else {
      _confettiController.forward();
    }
  }

  void _increment() {
    setState(() {
      if (_counter < 10) {
        _counter++;
      } else {
        _counter = 0;
      }
    });
  }

  void _initializeMethods() {
    _increment();
    _handleAnimation();
    _toggle();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SlideTransition(
          position: _offsetAnimation,
          child: Stack(children: [
            _CreateConfettiAnimation(
                animation: _animation,
                fadeAnimation: _fadeAnimation,
                isrotated: _isrotated),
            _CreateContainerAnimation(
                containerAnimation: _containerAnimation, counter: _counter),
          ]),
        ),
        const SizedBox(
          height: 50,
        ),
        _CreateClappingButton(
          onPressed: () {
            _initializeMethods();
          },
          showSecondImage: _counter == 10,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class _CreateContainerAnimation extends StatelessWidget {
  const _CreateContainerAnimation({
    required Animation<double> containerAnimation,
    required int counter,
  })  : _containerAnimation = containerAnimation,
        _counter = counter;

  final Animation<double> _containerAnimation;
  final int _counter;

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _containerAnimation,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.circular(50 / 2),
        ),
        child: Center(
          child: Text(
            '+$_counter',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class _CreateConfettiAnimation extends StatelessWidget {
  const _CreateConfettiAnimation({
    required Animation<double> animation,
    required Animation<double> fadeAnimation,
    required bool isrotated,
  })  : _animation = animation,
        _fadeAnimation = fadeAnimation,
        _isrotated = isrotated;

  final Animation<double> _animation;
  final Animation<double> _fadeAnimation;
  final bool _isrotated;

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: AnimatedBuilder(
        animation: _fadeAnimation,
        builder: (context, child) {
          return Opacity(
            opacity: _fadeAnimation.value,
            child: Transform.rotate(
                angle: _isrotated ? 30 * math.pi / 180 : 60 * math.pi / 180,
                child: child),
          );
        },
        child: const Confetti(),
      ),
    );
  }
}

class _CreateClappingButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool showSecondImage;

  const _CreateClappingButton({
    required this.onPressed,
    required this.showSecondImage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 72,
          width: 72,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 230, 65, 120),
            borderRadius: BorderRadius.circular(70 / 2),
          ),
        ).animate().blurXY(),
        Positioned(
          bottom: 0,
          top: 0,
          right: 0,
          left: 0,
          child: Center(
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.pink),
                borderRadius: BorderRadius.circular(70 / 2),
              ),
              child: ElevatedButton(
                onPressed: onPressed,
                child: showSecondImage
                    ? Image.asset('assert/images/clapping2.png')
                    : Image.asset('assert/images/clapping.png'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
