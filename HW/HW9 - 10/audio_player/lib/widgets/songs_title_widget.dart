import 'package:audio_player/widgets/widget_exports.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CreateSongTitle extends StatelessWidget {
  const CreateSongTitle({
    Key? key,
    required this.artistName,
    required this.songTitle,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.maxLines = 1,
    this.fontSize = 16,
    this.minFontSize = 16,
  }) : super(key: key);

  final String? artistName;
  final String? songTitle;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final int maxLines;
  final double fontSize;
  final double minFontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: mainAxisAlignment,
        children: [
          AutoSizeText(
            TextModifierService().removeTextAfter(
              artistName ?? 'No name',
            ),
            style: TextStyle(
                color: AppColors.white.color,
                fontSize: fontSize,
                fontFamily: AppFonts.lusitana.font,
                fontWeight: FontWeight.w400),
            maxFontSize: minFontSize,
            overflow: TextOverflow.ellipsis,
            maxLines: maxLines,
          ),
          Text(
            TextModifierService().removeTextAfter(songTitle ?? "No name"),
            style: TextStyle(
                fontFamily: AppFonts.colombia.font,
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
                color: Colors.white),
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
