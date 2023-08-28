import 'package:audio_player/app_logic/blocs/bloc_exports.dart';

import 'package:audio_player/screens/my_music_screens/my_music_folders/my_favorite_songs.dart';
import 'package:audio_player/screens/screens_export.dart';
import 'package:audio_player/screens/tab_bar/buttom_tab_bar.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, widget) => ButtomTabBarPage(
              key: state.pageKey,
              child: widget,
            ),
        routes: [
          GoRoute(
            path: routeNameMap[RouteName.playlist]!,
            pageBuilder: (context, state) => CupertinoPage(
              key: state.pageKey,
              child: const PlaylistPage(),
            ),
          ),
          GoRoute(
            path: routeNameMap[RouteName.artist]!,
            pageBuilder: (context, state) => CupertinoPage(
              key: state.pageKey,
              child: const ArtistPage(),
            ),
          ),
          GoRoute(
            path: routeNameMap[RouteName.home]!,
            pageBuilder: (context, state) => CupertinoPage(
              key: state.pageKey,
              child: MultiBlocProvider(
                providers: [
                  BlocProvider<AlbumBloc>(
                    create: (context) => AlbumBloc(AlbumRepository()),
                  ),
                  BlocProvider<FavoriteArtistBloc>(
                    create: (context) => FavoriteArtistBloc(GetIt.I()),
                  ),
                  BlocProvider<RecentlyPlayedBloc>(
                    create: (context) => RecentlyPlayedBloc(GetIt.I()),
                  ),
                ],
                child: const HomePage(),
              ),
            ),
          ),
          GoRoute(
            path: routeNameMap[RouteName.search]!,
            pageBuilder: (context, state) => CupertinoPage(
              key: state.pageKey,
              child: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => SearchResultBloc(SearchRepository()),
                  ),
                  BlocProvider<GenresBloc>(
                    create: (context) => GenresBloc(GetIt.I()),
                  ),
                  BlocProvider(
                    create: (context) => RecentlySearchedBloc(
                      GetIt.I(),
                    ),
                  ),
                ],
                child: const SearchPage(),
              ),
            ),
          ),
          GoRoute(
            path: routeNameMap[RouteName.myMusic]!,
            pageBuilder: (context, state) => CupertinoPage(
              key: state.pageKey,
              child: const MyMusicPage(),
            ),
          ),
        ]),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: routeNameMap[RouteName.favoriteTracks]!,
      pageBuilder: (context, state) => CupertinoPage(
        key: state.pageKey,
        child: const MyFavoriteSongs(),
      ),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: routeNameMap[RouteName.favoriteAlbums]!,
      pageBuilder: (context, state) => CupertinoPage(
        key: state.pageKey,
        child: const MyFavoriteAlbum(),
      ),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '${routeNameMap[RouteName.albumDetail]!}:id',
      pageBuilder: (context, state) => CupertinoPage(
          key: state.pageKey,
          child: MultiBlocProvider(
            providers: [
              BlocProvider<AlbumDetailBloc>(
                create: (context) => AlbumDetailBloc(GetIt.I()),
              ),
              BlocProvider(
                create: (context) => FavoriteBloc(
                  GetIt.I(),
                ),
              ),
            ],
            child: AlbumDetailPage(
              param: state.pathParameters['id'] ?? '',
              title: state.uri.queryParameters['title'] ?? '',
            ),
          )),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '${routeNameMap[RouteName.detailMusic]!}:id',
      builder: (context, state) => Builder(
        builder: (innerContext) {
          final songId = state.pathParameters['id'] ?? '';
          return SlideUpTransition(
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (blocContext) => DetailMusicPageBloc(
                    GetIt.I(),
                  ),
                ),
                BlocProvider(
                  create: (context) => FavoriteBloc(
                    GetIt.I(),
                  ),
                ),
              ],
              child: DetailMusicPage(
                param: songId,
              ),
            ),
          );
        },
      ),
    ),
  ],
);
