import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:portico/Helper/colors_fonts.dart';

import 'Controllers/profile_tab_bar_controller.dart';
import 'Controllers/saved_tab_bar_controller.dart';
import 'Controllers/useful_tab_bar_controller.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: AppColorData.white,
        dividerColor: Colors.black,
        highlightColor: AppColorData.darkRed,
        indicatorColor: AppColorData.darkRed,
        tabBarTheme: const TabBarTheme(
            labelColor: AppColorData.darkRed,
            unselectedLabelColor: Colors.black,
            indicatorColor: AppColorData.darkRed),
        cupertinoOverrideTheme: const CupertinoThemeData(
          primaryColor: AppColorData.darkRed,
          primaryContrastingColor: Color.fromARGB(255, 255, 255, 255),
          barBackgroundColor: AppColorData.white,
        ),
        appBarTheme: const AppBarTheme(
            backgroundColor: AppColorData.white,
            iconTheme: CupertinoIconThemeData(color: Colors.black)),
        navigationRailTheme: const NavigationRailThemeData(
          backgroundColor: AppColorData.white,
          unselectedIconTheme: IconThemeData(color: Colors.black),
          selectedIconTheme: IconThemeData(color: AppColorData.darkRed),
          unselectedLabelTextStyle: TextStyle(color: Colors.black),
          selectedLabelTextStyle: TextStyle(color: AppColorData.darkRed),
        ),
      ),
      home: const Portico(),
    );
  }
}

class Portico extends StatefulWidget {
  const Portico({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PorticoState createState() => _PorticoState();
}

class _PorticoState extends State<Portico> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    _tabController.index = 0;
    _tabController.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return CupertinoPortico(tabController: _tabController);
    } else if (Theme.of(context).platform == TargetPlatform.android) {
      return AndroidPortico(tabController: _tabController);
    } else {
      return WebPortico(tabController: _tabController);
    }
  }
}

class AndroidPortico extends StatelessWidget {
  const AndroidPortico({Key? key, required this.tabController})
      : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    final bool isIpad = MediaQuery.of(context).size.width > 600;
    return isIpad
        ? Row(
            children: [
              NavigationRail(
                selectedIndex: tabController.index,
                onDestinationSelected: (int index) {
                  tabController.index = index;
                },
                labelType: NavigationRailLabelType.all,
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.person),
                    label: Text('Profile'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.article),
                    label: Text('Useful'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text('Saved'),
                  ),
                ],
              ),
              const VerticalDivider(thickness: 1, width: 1),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    ProfileTabBarController(),
                    UsefulTabBarController(),
                    const SavedTabBarController(),
                  ],
                ),
              ),
            ],
          )
        : DefaultTabController(
            length: 3,
            child: Scaffold(
              body: TabBarView(
                controller: tabController,
                children: [
                  ProfileTabBarController(),
                  UsefulTabBarController(),
                  const SavedTabBarController(),
                ],
              ),
              bottomNavigationBar: SafeArea(
                child: TabBar(
                  controller: tabController,
                  tabs: const [
                    Tab(icon: Icon(Icons.person)),
                    Tab(icon: Icon(Icons.article)),
                    Tab(icon: Icon(Icons.favorite)),
                  ],
                ),
              ),
            ),
          );
  }
}

class WebPortico extends StatelessWidget {
  const WebPortico({Key? key, required this.tabController}) : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          controller: tabController,
          children: [
            ProfileTabBarController(),
            UsefulTabBarController(),
            const SavedTabBarController(),
          ],
        ),
        bottomNavigationBar: SafeArea(
            child: Container(
                color: const Color.fromARGB(255, 255, 253, 253),
                child: TabBar(
                  controller: tabController,
                  tabs: const [
                    Tab(icon: Icon(Icons.person)),
                    Tab(icon: Icon(Icons.article)),
                    Tab(icon: Icon(Icons.favorite)),
                  ],
                ))),
      ),
    );
  }
}

class CupertinoPortico extends StatelessWidget {
  const CupertinoPortico({Key? key, required this.tabController})
      : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    //final theme = Theme.of(context);
    final bool isIpad = MediaQuery.of(context).size.width > 600;
    return isIpad
        ? CupertinoPageScaffold(
            child: Row(
              children: [
                NavigationRail(
                  selectedIndex: tabController.index,
                  onDestinationSelected: (int index) {
                    tabController.index = index;
                  },
                  labelType: NavigationRailLabelType.all,
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.person),
                      label: Text('Profile'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.article),
                      label: Text('Useful'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.favorite),
                      label: Text('Saved'),
                    ),
                  ],
                ),
                const VerticalDivider(thickness: 1, width: 1),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      ProfileTabBarController(),
                      UsefulTabBarController(),
                      const SavedTabBarController(),
                    ],
                  ),
                ),
              ],
            ),
          )
        : CupertinoTabScaffold(
            tabBuilder: (context, index) {
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(
                    child: getContentForTab(index),
                  );
                },
              );
            },
            tabBar: CupertinoTabBar(
              items: const [
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.person)),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.square_favorites_fill)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border_outlined)),
              ],
              currentIndex: tabController.index,
              onTap: (index) {
                tabController.index = index;
              },
              inactiveColor: Colors.black,
            ),
          );
  }

  Widget getContentForTab(int index) {
    switch (index) {
      case 0:
        return ProfileTabBarController();
      case 1:
        return UsefulTabBarController();
      case 2:
        return const SavedTabBarController();
      default:
        return Container();
    }
  }
}
