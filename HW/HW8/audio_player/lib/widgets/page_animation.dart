import 'package:flutter/material.dart';

class SlideUpTransition extends StatefulWidget {
  final Widget child;

  const SlideUpTransition({Key? key, required this.child}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SlideUpTransitionState createState() => _SlideUpTransitionState();
}

class _SlideUpTransitionState extends State<SlideUpTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    const animationDuration = Duration(milliseconds: 1000);
    const animationCurve = Curves.linear; // Choose your desired curve

    animationController = AnimationController(
      vsync: this,
      duration: animationDuration,
    );

    final curvedAnimation = CurvedAnimation(
      parent: animationController,
      curve: animationCurve,
    );

    animation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(curvedAnimation);

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose(); // Don't forget to dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: widget.child,
    );
  }
}
