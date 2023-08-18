import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/screens/my_music_folders/my_favorite_album.dart';
import 'package:audio_player/screens/screens_export.dart';
import 'package:audio_player/services/services.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'my_music_folders/my_favorite_songs.dart';

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
              pageBuilder: (context, state) => CupertinoPage(
                    child: MultiBlocProvider(
                      providers: [
                        BlocProvider<AlbumBloc>(
                          create: (context) => AlbumBloc(AlbumRepository()),
                        ),
                        BlocProvider<FavoriteArtistBloc>(
                          create: (context) =>
                              FavoriteArtistBloc(RecentlyPlayedRepository()),
                        ),
                        BlocProvider<RecentlyPlayedBloc>(
                          create: (context) =>
                              RecentlyPlayedBloc(RecentlyPlayedRepository()),
                        ),
                      ],
                      child: const HomePage(),
                    ),
                  ),
              routes: [
                GoRoute(
                  path: 'detail_music/:id',
                  builder: (context, state) => Builder(
                    builder: (innerContext) {
                      final songId = state.pathParameters['id'] ?? '';
                      return SlideUpTransition(
                        child: BlocProvider(
                          create: (blocContext) =>
                              DetailMusicPageBloc(SongDetailRepository()),
                          child: DetailMusicPage(
                            param: songId,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                GoRoute(
                  path: 'album_detail/:id',
                  pageBuilder: (context, state) => CupertinoPage(
                    child: BlocProvider<AlbumDetailBloc>(
                      create: (context) =>
                          AlbumDetailBloc(AlbumDetailsRepository()),
                      child: AlbumDetailPage(
                        param: state.pathParameters['id'] ?? '',
                        title: state.uri.queryParameters['title'] ?? '',
                      ),
                    ),
                  ),
                ),
                GoRoute(
                  path: 'tracks',
                  pageBuilder: (context, state) => const CupertinoPage(
                    child: MyFavoriteSongs(),
                  ),
                ),
                GoRoute(
                  path: 'albums',
                  pageBuilder: (context, state) => const CupertinoPage(
                    child: MyFavoriteAlbum(),
                  ),
                ),
              ]),
          GoRoute(
            path: '/search',
            pageBuilder: (context, state) => CupertinoPage(
              child: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => SearchResultBloc(SearchRepository()),
                  ),
                  BlocProvider<GenresBloc>(
                    create: (context) => GenresBloc(GenresRepository()),
                  ),
                ],
                child: const SearchPage(),
              ),
            ),
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
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider<FavoriteProvider>(
      create: (context) => FavoriteProvider(),
      child: ChangeNotifierProvider<RecentlySearchedProvider>(
        create: (context) => RecentlySearchedProvider(),
        child: MaterialApp.router(
            routerConfig: _router,
            theme: ThemeData(
                splashColor: Colors.transparent,
                textTheme: TextTheme(
                  titleLarge: TextStyle(
                      color: AppColors.white.color,
                      fontSize: getResponsiveSize(maxWidth, 30),
                      fontFamily: AppFonts.lusitana.font,
                      fontWeight: FontWeight.w400),
                  titleMedium: TextStyle(
                      color: AppColors.white.color,
                      fontSize: getResponsiveSize(maxWidth, 23),
                      fontFamily: AppFonts.lusitana.font,
                      fontWeight: FontWeight.w400),
                  titleSmall: TextStyle(
                      color: AppColors.white.color,
                      fontSize: getResponsiveSize(maxWidth, 20),
                      fontFamily: AppFonts.lusitana.font,
                      fontWeight: FontWeight.w500),
                  bodyLarge: TextStyle(
                      color: AppColors.white.color,
                      fontSize: getResponsiveSize(maxWidth, 20),
                      fontFamily: AppFonts.colombia.font,
                      fontWeight: FontWeight.w700),
                  bodyMedium: TextStyle(
                    color: Colors.white,
                    fontFamily: AppFonts.lusitana.font,
                    fontSize: getResponsiveSize(maxWidth, 13),
                    fontWeight: FontWeight.w500,
                  ),
                  bodySmall: TextStyle(
                      fontFamily: AppFonts.colombia.font,
                      fontSize: getResponsiveSize(maxWidth, 16),
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                  displayMedium: TextStyle(
                    fontFamily: AppFonts.montserrat.font,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white.color,
                    fontSize: getResponsiveSize(maxWidth, 13),
                  ),
                  displaySmall: TextStyle(
                      fontFamily: AppFonts.montserrat.font,
                      fontSize: getResponsiveSize(maxWidth, 12),
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 123, 123, 123)),
                ))),
      ),
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
  @override
  void dispose() {
    context.read<TabBarBloc>().close();
    super.dispose();
  }

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
              useLegacyColorScheme: false,
              currentIndex: tabIndex,
              onTap: (index) {
                final tabBarBloc = context.read<TabBarBloc>();
                tabBarBloc.setTabIndex(index);
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
                    context.go('/search');
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
