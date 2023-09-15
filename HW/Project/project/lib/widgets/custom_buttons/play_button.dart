import 'package:project/app_logic/providers/web_detail_music_provider.dart';
import 'package:project/widgets/responsive_widgets/hovered_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatePlayButton extends StatefulWidget {
  const CreatePlayButton({
    super.key,
    required this.size,
    required this.id,
    this.onPressed,
    required this.iconColor,
    required this.containerColor,
  });
  final Color iconColor;
  final Color containerColor;
  final int id;
  final VoidCallback? onPressed;
  final double size;

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
        Provider.of<RecentlyPlayedIdProvider>(context, listen: false)
            .setId(widget.id.toString());
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
            child: Icon(
              Icons.play_arrow,
              color: widget.iconColor,
            ),
          );
        }),
      ),
    );
  }
}
