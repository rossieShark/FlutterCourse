import 'package:project/screens/tab_bar/index.dart';
import 'package:project/widgets/widget_exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IPadTabBar extends StatelessWidget {
  const IPadTabBar({super.key, required this.tabIndex, required this.child});

  final int tabIndex;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            backgroundColor: AppColors.background.color,
            selectedIconTheme: IconThemeData(color: AppColors.accent.color),
            unselectedIconTheme: IconThemeData(color: AppColors.white.color),
            selectedIndex: tabIndex,
            selectedLabelTextStyle: TextStyle(color: AppColors.accent.color),
            unselectedLabelTextStyle: TextStyle(color: AppColors.white.color),
            onDestinationSelected: (int index) {
              NavigationUtils.mobileHandleTabTap(context, index);
            },
            destinations: [
              DestinationData(
                  const Icon(CupertinoIcons.music_albums), 'Playlist'),
              DestinationData(const Icon(CupertinoIcons.music_mic), 'Artist'),
              DestinationData(const CustomAnimatedContainer(), 'Search'),
              DestinationData(const Icon(CupertinoIcons.search), 'Search'),
              DestinationData(
                  const Icon(Icons.favorite_border_outlined), 'My music'),
            ],
          ),
          VerticalDivider(
            thickness: 1,
            width: 1,
            color: AppColors.white.color,
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              width: double.infinity,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
