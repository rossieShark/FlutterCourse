import 'package:flutter/material.dart';

class CreateScrollSection extends StatelessWidget {
  final bool _isScrolling;
  final bool _canScrollUp;
  final bool _canScrollDown;
  final ScrollController _scrollController;
  const CreateScrollSection(this._isScrolling, this._canScrollDown,
      this._canScrollUp, this._scrollController,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _canScrollUp && _isScrolling
            ? IconButton(
                icon: const Icon(Icons.arrow_upward),
                color: Colors.white,
                onPressed: () {
                  _scrollController.animateTo(
                    _scrollController.offset - 100,
                    curve: Curves.linear,
                    duration: const Duration(milliseconds: 300),
                  );
                },
              )
            : Container(),
        if (_canScrollDown && _isScrolling)
          IconButton(
            icon: const Icon(Icons.arrow_downward),
            color: Colors.white,
            onPressed: () {
              _scrollController.animateTo(
                _scrollController.offset + 100,
                curve: Curves.linear,
                duration: const Duration(milliseconds: 300),
              );
            },
          ),
      ],
    );
  }
}
