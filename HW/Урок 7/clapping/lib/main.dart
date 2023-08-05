import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late AnimationController _confettiController;
  late Animation<double> _animation;
  late Animation<double> _containerAnimation;
  late Animation<double> _fadeAnimation;
  bool isrotated = true;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _confettiController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );

    _offsetAnimation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(0, -10),
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

  void toggle() {
    setState(() {
      isrotated = !isrotated;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _confettiController.dispose();
    super.dispose();
  }

  void startAnimation() {
    if (counter == 10) {
      _controller.forward();
      // } else {
      //   if (_confettiController.status == AnimationStatus.completed ||
      //       _confettiController.status == AnimationStatus.forward) {
      //     _confettiController.reverse();
    } else {
      _confettiController.forward();
    }
    // }
  }

  void endAnimation() {
    if (counter == 0) {
      _controller.reset();
    }
  }

  int counter = 0;
  void increment() {
    setState(() {
      if (counter < 10) {
        counter++;
      } else {
        counter = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Clap-clap'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: _offsetAnimation,
              child: Stack(children: [
                ScaleTransition(
                  scale: _animation,
                  child: AnimatedBuilder(
                      animation: _fadeAnimation,
                      builder: (context, child) {
                        return Opacity(
                            opacity: _fadeAnimation.value,
                            child: Transform.rotate(
                                angle: isrotated
                                    ? 30 * math.pi / 180
                                    : 60 * math.pi / 180,
                                child: Confetti()));
                      }),
                ),
                ScaleTransition(
                  scale: _containerAnimation,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(50 / 2)),
                    child: Center(
                      child: Text(
                        '+$counter',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 50,
            ),
            Stack(children: [
              Container(
                height: 72,
                width: 72,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 230, 65, 120),
                    borderRadius: BorderRadius.circular(70 / 2)),
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
                        borderRadius: BorderRadius.circular(70 / 2)),
                    child: ElevatedButton(
                      onPressed: () {
                        increment();
                        startAnimation();
                        endAnimation();
                        toggle();
                      },
                      child: counter != 10
                          ? Image.asset('assert/images/clapping.png')
                          : Image.asset('assert/images/clapping2.png'),
                    ),
                  ),
                ),
              )
            ]),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class Confetti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      child: Center(
        child: Stack(
          children: [
            PositionedImage(index: 0, total: 5),
            PositionedImage(index: 1, total: 5),
            PositionedImage(index: 2, total: 5),
            PositionedImage(index: 3, total: 5),
            PositionedImage(index: 4, total: 5),
          ],
        ),
      ),
    );
  }
}

class PositionedImage extends StatelessWidget {
  final int index;
  final int total;
  static const double radius = 18;

  PositionedImage({required this.index, required this.total});

  @override
  Widget build(BuildContext context) {
    double angle = 2 * math.pi * (index) / total;
    double x = radius * math.cos(angle);
    double y = radius * math.sin(angle);

    return Positioned(
      left: 20 + x, 
      top: 20 + y,
      child: Transform.rotate(
        angle: angle,
        child: Image.asset(
          'assert/images/confetti.png', 
          width: 5,
          height: 5,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
