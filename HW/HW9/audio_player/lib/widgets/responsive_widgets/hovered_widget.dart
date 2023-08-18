import 'package:flutter/material.dart';

class HoverableWidget extends StatefulWidget {
  final Widget Function(BuildContext, Widget?, bool) builder;
  final Widget? child;
  const HoverableWidget({
    required this.builder,
    this.child,
    super.key,
  });
  @override
  State<HoverableWidget> createState() => _HoverableWidgetState();
}

class _HoverableWidgetState extends State<HoverableWidget> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          _isHovered = false;
        });
      },
      child: widget.builder(context, widget.child, _isHovered),
    );
  }
}
