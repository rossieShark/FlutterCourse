import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/screens/index.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _webNavKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
final _webShellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, widget) => TabBarContent(
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
              child: const HomePage().createWithMultiProviders([
                BlocProvider<AlbumBloc>(
                  create: (_) => GetIt.I.get(),
                ),
                BlocProvider<FavoriteArtistBloc>(
                  create: (context) => GetIt.I.get(),
                ),
                BlocProvider<RecentlyPlayedBloc>(
                  create: (context) => GetIt.I.get(),
                ),
              ]),
            ),
          ),
          GoRoute(
            path: routeNameMap[RouteName.search]!,
            pageBuilder: (context, state) => CupertinoPage(
              key: state.pageKey,
              child: const SearchPage().createWithMultiProviders([
                BlocProvider<SearchResultBloc>(
                  create: (context) => GetIt.I.get(),
                ),
                BlocProvider<GenresBloc>(
                  create: (context) => GetIt.I.get(),
                ),
                BlocProvider<RecentlySearchedBloc>(
                  create: (context) => GetIt.I.get(),
                ),
              ]),
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
      path: '/${routeNameMap[RouteName.favoriteTracks]!}',
      pageBuilder: (context, state) => CupertinoPage(
        key: state.pageKey,
        child: const MyFavoriteSongs(),
      ),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/${routeNameMap[RouteName.favoriteAlbums]!}',
      pageBuilder: (context, state) => CupertinoPage(
        key: state.pageKey,
        child: const MyFavoriteAlbum(),
      ),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/${routeNameMap[RouteName.albumDetail]!}:id',
      pageBuilder: (context, state) => CupertinoPage(
        key: state.pageKey,
        child: AlbumDetailPage(
          param: state.pathParameters['id'] ?? '',
          image: state.uri.queryParameters['image'] ?? '',
          title: state.uri.queryParameters['title'] ?? '',
          artist: state.uri.queryParameters['artist'] ?? '',
        ).createWithMultiProviders([
          BlocProvider<AlbumDetailBloc>(
            create: (context) => GetIt.I.get(),
          ),
          BlocProvider<FavoriteBloc>(
            create: (context) => GetIt.I.get(),
          ),
        ]),
      ),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/${routeNameMap[RouteName.detailMusic]!}:id',
      builder: (context, state) => Builder(
        builder: (innerContext) {
          final songId = state.pathParameters['id'] ?? '';
          return SlideUpTransition(
            child: MobileDetailMusicPage(
              param: songId,
            ).createWithMultiProviders([
              BlocProvider<DetailMusicPageBloc>(
                create: (blocContext) => GetIt.I.get(),
              ),
              BlocProvider<FavoriteBloc>(
                create: (context) => GetIt.I.get(),
              ),
            ]),
          );
        },
      ),
    ),
  ],
);

final webRouter = GoRouter(
    navigatorKey: _webNavKey,
    initialLocation: routeNameMap[RouteName.home]!,
    routes: [
      ShellRoute(
          navigatorKey: _webShellNavigatorKey,
          builder: (context, state, widget) => TabBarContent(
                key: state.pageKey,
                child: widget,
              ),
          routes: [
            GoRoute(
                path: routeNameMap[RouteName.home]!,
                pageBuilder: (context, state) => CupertinoPage(
                      key: state.pageKey,
                      child: const HomePage().createWithMultiProviders([
                        BlocProvider<AlbumBloc>(
                          create: (_) => GetIt.I.get(),
                        ),
                        BlocProvider<FavoriteArtistBloc>(
                          create: (context) => GetIt.I.get(),
                        ),
                        BlocProvider<RecentlyPlayedBloc>(
                          create: (context) => GetIt.I.get(),
                        ),
                      ]),
                    ),
                routes: [
                  GoRoute(
                    path: 'detail_music/:id',
                    builder: (context, state) => Builder(
                      builder: (innerContext) {
                        final songId = state.pathParameters['id'] ?? '';
                        return SlideUpTransition(
                          child: MobileDetailMusicPage(
                            param: songId,
                          ).createWithMultiProviders(
                            [
                              BlocProvider<DetailMusicPageBloc>(
                                create: (blocContext) => GetIt.I.get(),
                              ),
                              BlocProvider<FavoriteBloc>(
                                create: (context) => GetIt.I.get(),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  GoRoute(
                    path: '${routeNameMap[RouteName.albumDetail]!}:id',
                    pageBuilder: (context, state) => CupertinoPage(
                      key: state.pageKey,
                      child: AlbumDetailPage(
                        param: state.pathParameters['id'] ?? '',
                        image: state.uri.queryParameters['image'] ?? '',
                        title: state.uri.queryParameters['title'] ?? '',
                        artist: state.uri.queryParameters['artist'] ?? '',
                      ).createWithMultiProviders([
                        BlocProvider<AlbumDetailBloc>(
                          create: (context) => GetIt.I.get(),
                        ),
                        BlocProvider<FavoriteBloc>(
                          create: (context) => GetIt.I.get(),
                        )
                      ]),
                    ),
                  ),
                  GoRoute(
                    path: routeNameMap[RouteName.favoriteTracks]!,
                    pageBuilder: (context, state) => const CupertinoPage(
                      child: MyFavoriteSongs(),
                    ),
                  ),
                  GoRoute(
                    path: routeNameMap[RouteName.favoriteAlbums]!,
                    pageBuilder: (context, state) => const CupertinoPage(
                      child: MyFavoriteAlbum(),
                    ),
                  ),
                ]),
            GoRoute(
              path: routeNameMap[RouteName.myMusic]!,
              pageBuilder: (context, state) => CupertinoPage(
                key: state.pageKey,
                child: const MyMusicPage(),
              ),
            ),
            GoRoute(
              path: routeNameMap[RouteName.search]!,
              pageBuilder: (context, state) => CupertinoPage(
                key: state.pageKey,
                child: const SearchPage().createWithMultiProviders([
                  BlocProvider<SearchResultBloc>(
                    create: (context) => GetIt.I.get(),
                  ),
                  BlocProvider<GenresBloc>(
                    create: (context) => GetIt.I.get(),
                  ),
                  BlocProvider<RecentlySearchedBloc>(
                    create: (context) => GetIt.I.get(),
                  ),
                ]),
              ),
            ),
          ]),
    ]);
