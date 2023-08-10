import 'package:audio_player/screens/screens_export.dart';
import 'package:audio_player/widgets/page_animation.dart';
import 'package:audio_player/widgets/ui_properties.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    ShellRoute(
        builder: (context, state, widget) => ButtomTabBarPage(
              child: widget,
            ),
        routes: [
          GoRoute(
            path: '/playlist',
            pageBuilder: (context, state) => const CupertinoPage(
              child: PlaylistPage(),
            ),
          ),
          GoRoute(
            path: '/artist',
            pageBuilder: (context, state) => const CupertinoPage(
              child: ArtistPage(),
            ),
          ),
          GoRoute(
              path: '/',
              pageBuilder: (context, state) => const CupertinoPage(
                    child: HomePage(),
                  ),
              routes: [
                GoRoute(
                  path: 'detail_music/:id',
                  builder: (context, state) => Builder(
                    builder: (innerContext) => SlideUpTransition(
                      child: DetailMusicPage(
                        param: state.pathParameters['id'] ?? '',
                      ),
                    ),
                  ),
                ),
                GoRoute(
                  path: 'album_detail/:id',
                  pageBuilder: (context, state) => CupertinoPage(
                    child: AlbumDetailPage(
                      param: state.pathParameters['id'] ?? '',
                    ),
                  ),
                ),
              ]),
          GoRoute(
            path: '/genres',
            pageBuilder: (context, state) =>
                const CupertinoPage(child: GenresPage()),
          ),
          GoRoute(
            path: '/my_music',
            pageBuilder: (context, state) => const CupertinoPage(
              child: MyMusicPage(),
            ),
          ),
        ]),
  ],
);

class TabBarScreen extends StatelessWidget {
  const TabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

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
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
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
            useLegacyColorScheme: false,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
              switch (index) {
                case 0:
                  context.go('/playlist');
                  break;
                case 1:
                  context.go('/artist');
                  break;
                case 2:
                  context.go('/');
                  break;
                case 3:
                  context.go('/genres');
                  break;
                case 4:
                  context.go('/my_music');
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
                  CupertinoIcons.music_note,
                ),
                label: 'Genres',
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
  }
}
