import 'package:audio_player/screens/screens_export.dart';
import 'package:audio_player/screens/tab_bar/additional_widgets/animated_container.dart';
import 'package:audio_player/widgets/widget_exports.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MobileVersion extends StatelessWidget {
  const MobileVersion({super.key, required this.tabIndex, required this.child});

  final int tabIndex;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    bool isHomePage(int tabIndex) {
      return tabIndex == 2;
    }

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: isHomePage(tabIndex) ? false : true,
          showUnselectedLabels: tabIndex == 2 ? false : true,
          backgroundColor: AppColors.background.color,
          selectedIconTheme: IconThemeData(color: AppColors.accent.color),
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(color: AppColors.accent.color),
          unselectedIconTheme: IconThemeData(color: AppColors.white.color),
          unselectedLabelStyle: TextStyle(color: AppColors.white.color),
          selectedItemColor: Colors.transparent,
          unselectedItemColor: Colors.transparent,
          //fixedColor: Colors.transparent,
          useLegacyColorScheme: false,
          currentIndex: tabIndex,
          onTap: (index) {
            TabNavigationUtils.handleTabTap(context, index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.music_albums,
              ),
              label: 'Playlist',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.music_mic,
              ),
              label: 'Artist',
            ),
            BottomNavigationBarItem(
              icon: CustomAnimatedContainer(),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.search,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border_outlined,
              ),
              label: 'My music',
            ),
          ]),
    );
  }
}
