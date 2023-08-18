import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool isTappedTextField;
  final Function(String) onChanged;
  final VoidCallback onPressed;

  const SearchTextField({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.isTappedTextField,
    required this.onChanged,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      cursorColor: AppColors.accent.color,
      focusNode: widget.focusNode,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 6.0),
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        hintText: widget.focusNode.hasFocus ? '' : 'Song, Artist name',
        hintStyle: Theme.of(context).textTheme.bodySmall,
        labelStyle: TextStyle(color: AppColors.white.color),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: widget.focusNode.hasFocus
                ? AppColors.white.color
                : AppColors.accent.color,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: AppColors.white.color)),
        suffixIcon: widget.controller.text.isNotEmpty
            ? IconButtonWidget(
                iconData: Icons.clear,
                color: AppColors.accent.color,
                onPressed: widget.onPressed,
              )
            : null,
      ),
      style: Theme.of(context).textTheme.bodySmall,
      onChanged: widget.onChanged,
    );
  }
}
