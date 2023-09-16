import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';

import 'package:audio_player/screens/search_screen/search_export.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class MobileRecentlySearchedSection extends StatelessWidget {
  const MobileRecentlySearchedSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RecentlySearchedProvider>(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          AppLocalizations.of(context)!.searchHistoryText,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      Center(
        child: Container(
          height: 10,
          width: MediaQuery.of(context).size.width - 32,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: AppColors.accent.color, width: 1))),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      RecentlySearchedList(width: MediaQuery.of(context).size.width),
      Center(
        child: TextButton(
          onPressed: () {
            provider.removeAll();
          },
          child: Text(
            AppLocalizations.of(context)!.clearAll,
            style: TextStyle(
                color: AppColors.white.color,
                fontSize: 13,
                fontFamily: AppFonts.colombia.font,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    ]);
  }
}
