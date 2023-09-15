import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class NoResultsWidget extends StatelessWidget {
  const NoResultsWidget({super.key});

  final double tabBarWidth = 51;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ResponsiveBuilder(
      narrow: width,
      medium: width - tabBarWidth,
      large: width - tabBarWidth,
      builder: (context, child, widthVal) {
        return SizedBox(
            height: MediaQuery.of(context).size.height,
            width: width,
            child: child);
      },
      child: Center(
        child: Text(
          AppLocalizations.of(context)!.noResultsText,
          style: TextStyle(color: AppColors.white.color, fontSize: 25),
        ),
      ),
    );
  }
}
