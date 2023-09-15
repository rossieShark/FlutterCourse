import 'package:project/app_logic/blocs/bloc_exports.dart';

import 'package:project/screens/search_screen/search_export.dart';
import 'package:project/widgets/widget_exports.dart';
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
          'Search History',
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
            'Clear all',
            style: TextStyle(
                color: AppColors.white.color,
                fontSize: 20,
                fontFamily: AppFonts.colombia.font,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    ]);
  }
}
