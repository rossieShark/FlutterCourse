import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/screens/tab_bar/go_router.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtomTabBarPage extends StatefulWidget {
  final Widget child;
  const ButtomTabBarPage({
    required this.child,
    super.key,
  });

  @override
  State<ButtomTabBarPage> createState() => _ButtomTabBarPageState();
}

class _ButtomTabBarPageState extends State<ButtomTabBarPage> {
  @override
  // void dispose() {
  //   context.read<TabBarBloc>().close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBarBloc, int>(builder: (context, tabIndex) {
      return WillPopScope(
        onWillPop: () async {
          final result = await showDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                    title: const Text("Are you sure you want to exit?"),
                    actions: [
                      CupertinoActionSheetAction(
                          onPressed: () {
                            context.pop(true);
                          },
                          child: const Text('Yes')),
                      CupertinoActionSheetAction(
                        onPressed: () {
                          context.pop(false);
                        },
                        child: const Text('No'),
                      ),
                    ]);
              });
          return result == true;
        },
        child: Scaffold(
          body: widget.child,
          bottomNavigationBar: BottomNavigationBar(
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
                final tabBarBloc = context.read<TabBarBloc>();
                tabBarBloc.setTabIndex(index);
                switch (index) {
                  case 0:
                    context.go(
                      routeNameMap[RouteName.playlist]!,
                    );
                    break;
                  case 1:
                    context.go(
                      routeNameMap[RouteName.artist]!,
                    );
                    break;
                  case 2:
                    context.go(
                      routeNameMap[RouteName.home]!,
                    );
                    break;
                  case 3:
                    context.go(
                      routeNameMap[RouteName.search]!,
                    );
                    break;
                  case 4:
                    context.go(
                      routeNameMap[RouteName.myMusic]!,
                    );
                    break;
                }
              },
              items: [
                const BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.music_albums,
                  ),
                  label: 'Playlist',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.music_mic,
                  ),
                  label: 'Artist',
                ),
                BottomNavigationBarItem(
                  icon: ClipRRect(
                    borderRadius: BorderRadius.circular(45),
                    child: AnimateGradient(
                      primaryBegin: Alignment.topLeft,
                      primaryEnd: Alignment.bottomLeft,
                      secondaryBegin: Alignment.bottomLeft,
                      secondaryEnd: Alignment.topRight,
                      primaryColors: const [
                        Color.fromARGB(255, 156, 14, 80),
                        Color.fromARGB(255, 129, 24, 59),
                        Color.fromARGB(255, 138, 46, 77),
                      ],
                      secondaryColors: const [
                        Color.fromARGB(255, 156, 90, 112),
                        Color.fromARGB(255, 238, 220, 231),
                        Color.fromARGB(255, 176, 70, 119),
                      ],
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(Icons.home_rounded,
                              color: AppColors.white.color),
                        ),
                      ),
                    ),
                  ),
                  label: '',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.search,
                  ),
                  label: 'Search',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_border_outlined,
                  ),
                  label: 'My music',
                ),
              ]),
        ),
      );
    });
  }
}
