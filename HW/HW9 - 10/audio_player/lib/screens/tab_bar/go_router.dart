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
                    create: (_) => GetIt.I.get(),
                  ),
                  BlocProvider<FavoriteArtistBloc>(
                    create: (context) => GetIt.I.get(),
                  ),
                  BlocProvider<RecentlyPlayedBloc>(
                    create: (context) => GetIt.I.get(),
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
                  BlocProvider<SearchResultBloc>(
                    create: (context) => GetIt.I.get(),
                  ),
                  BlocProvider<GenresBloc>(
                    create: (context) => GetIt.I.get(),
                  ),
                  BlocProvider<RecentlySearchedBloc>(
                    create: (context) => GetIt.I.get(),
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
                create: (context) => GetIt.I.get(),
              ),
              BlocProvider<FavoriteBloc>(
                create: (context) => GetIt.I.get(),
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
                BlocProvider<DetailMusicPageBloc>(
                  create: (blocContext) => GetIt.I.get(),
                ),
                BlocProvider<FavoriteBloc>(
                  create: (context) => GetIt.I.get(),
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
