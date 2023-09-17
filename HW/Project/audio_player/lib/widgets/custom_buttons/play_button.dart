import 'package:audio_player/widgets/responsive_widgets/hovered_widget.dart';
import 'package:flutter/material.dart';

class CreatePlayButton extends StatefulWidget {
  const CreatePlayButton(
      {super.key,
      required this.size,
      this.onPressed,
      required this.containerColor,
      required this.icon});

  final Color containerColor;

  final VoidCallback? onPressed;
  final double size;
  final Icon icon;

  @override
  State<CreatePlayButton> createState() => _CreatePlayButtonState();
}

class _CreatePlayButtonState extends State<CreatePlayButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 50),
    vsync: this,
    value: 1.0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onPressed != null) {
          widget.onPressed!();
        }
        _controller.reverse().then((value) => _controller.forward());
      },
      child: ScaleTransition(
        scale: Tween(begin: 0.8, end: 1.0).animate(
          CurvedAnimation(parent: _controller, curve: Curves.linear),
        ),
        child: HoverableWidget(builder: (context, child, isHovered) {
          return Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: widget.containerColor),
              child: widget.icon);
        }),
      ),
    );
  }
}
