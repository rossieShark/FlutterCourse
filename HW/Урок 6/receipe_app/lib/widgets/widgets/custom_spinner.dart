import 'package:flutter/material.dart';

import 'ui_widget.dart';

class CustomSpinner extends StatefulWidget {
  const CustomSpinner({super.key});

  @override

  // ignore: library_private_types_in_public_api
  _CustomSpinnerState createState() => _CustomSpinnerState();
}

class _CustomSpinnerState extends State<CustomSpinner>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  // ignore: unused_field
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animationController,
      alignment: Alignment.center,
      child: Image.asset(
        AppImages.loading.image,
        width: 40,
        height: 40,
      ),
    );
  }
}
