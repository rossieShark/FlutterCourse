import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationUtils {
  static void mobileHandleTabTap(BuildContext context, int index) {
    final tabBarBloc = context.read<TabBarBloc>();
    tabBarBloc.setTabIndex(index);

    switch (index) {
      // case 0:
      //   context.go(routeNameMap[RouteName.playlist]!);
      //   break;
      // case 1:
      //   context.go(routeNameMap[RouteName.artist]!);
      //   break;
      case 0:
        context.go(routeNameMap[RouteName.myMusic]!);
        break;
      case 1:
        context.go(routeNameMap[RouteName.home]!);
        break;

      case 2:
        context.go(routeNameMap[RouteName.search]!);
        break;
    }
  }

  static void WebHandleTabTap(BuildContext context, int index) {
    final tabBarBloc = context.read<TabBarBloc>();
    tabBarBloc.setTabIndex(index);

    switch (index) {
      case 0:
        context.go(routeNameMap[RouteName.home]!);
        break;
      case 1:
        context.go(routeNameMap[RouteName.search]!);
        break;
    }
  }
}

enum RouteName {
  home,
  myMusic,
  search,
  // artist,
  // playlist,
  favoriteTracks,
  favoriteAlbums,
  detailMusic,
  albumDetail,
  settings,
  sigIn,
  signUp,
  start,
}

Map<RouteName, String> routeNameMap = {
  RouteName.home: '/',
  // RouteName.artist: '/artist',
  RouteName.search: '/search',
  RouteName.myMusic: '/my_music',
  // RouteName.playlist: '/playlist',
  RouteName.favoriteTracks: 'tracks',
  RouteName.favoriteAlbums: 'albums',
  RouteName.detailMusic: 'detail_music/',
  RouteName.albumDetail: 'album_detail/',
  RouteName.settings: 'settings',
  RouteName.sigIn: '/signin',
  RouteName.signUp: '/signup',
  RouteName.start: '/start',
};
