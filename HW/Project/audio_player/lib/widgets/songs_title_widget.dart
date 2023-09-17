import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
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
    this.fontSize = 13,
    this.minFontSize = 13,
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
              artistName ?? AppLocalizations.of(context)!.noName,
            ),
            style: TextStyle(
                color: AppColors.white.color,
                fontSize: fontSize,
                fontFamily: AppFonts.lusitana.font,
                fontWeight: FontWeight.w600),
            maxFontSize: minFontSize,
            overflow: TextOverflow.ellipsis,
            maxLines: maxLines,
          ),
          Text(
            TextModifierService().removeTextAfter(
                songTitle ?? AppLocalizations.of(context)!.noName),
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
