import 'package:audio_player/screens/tab_bar/additional_widgets/animated_container.dart';
import 'package:audio_player/screens/tab_bar/additional_widgets/navigation_routes.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IPadVersion extends StatelessWidget {
  const IPadVersion({super.key, required this.tabIndex, required this.child});

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
              TabNavigationUtils.handleTabTap(context, index);
            },
            destinations: const [
              NavigationRailDestination(
                icon: Icon(CupertinoIcons.music_albums),
                label: Text(
                  'Playlist',
                  style: TextStyle(),
                ),
              ),
              NavigationRailDestination(
                icon: Icon(CupertinoIcons.music_mic),
                label: Text('Artist'),
              ),
              NavigationRailDestination(
                icon: CustomAnimatedContainer(),
                label: Text('Search'),
              ),
              NavigationRailDestination(
                icon: Icon(CupertinoIcons.search),
                label: Text('Search'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.favorite_border_outlined),
                label: Text('My music'),
              ),
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
