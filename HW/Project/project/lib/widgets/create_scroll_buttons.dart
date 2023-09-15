import 'package:project/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class CreateScrollButtons extends StatelessWidget {
  const CreateScrollButtons({
    super.key,
    required this.isHovered,
    required bool canScrollForward,
    required ScrollController horizontalScroll,
    required bool canScrollBack,
  })  : _canScrollForward = canScrollForward,
        _horizontalScroll = horizontalScroll,
        _canScrollBack = canScrollBack;
  final bool isHovered;
  final bool _canScrollForward;
  final ScrollController _horizontalScroll;
  final bool _canScrollBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isHovered && _canScrollForward
            ? Container(
                width: 35,
                height: 50,
                color: AppColors.accent.color.withOpacity(0.3),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  color: AppColors.white.color,
                  onPressed: () {
                    _horizontalScroll.animateTo(
                      _horizontalScroll.offset + 100,
                      curve: Curves.linear,
                      duration: const Duration(milliseconds: 300),
                    );
                  },
                ),
              )
            : Container(),
        if (isHovered && _canScrollBack)
          Container(
            width: 35,
            height: 50,
            color: AppColors.accent.color.withOpacity(0.4),
            child: IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              color: AppColors.white.color,
              onPressed: () {
                _horizontalScroll.animateTo(
                  _horizontalScroll.offset - 100,
                  curve: Curves.linear,
                  duration: const Duration(milliseconds: 300),
                );
              },
            ),
          ),
      ],
    );
  }
}
