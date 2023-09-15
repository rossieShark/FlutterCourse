import 'package:project/app_logic/blocs/bloc_exports.dart';
import 'package:project/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class AudioPlayerApp extends StatefulWidget {
  final GoRouter router;
  const AudioPlayerApp({Key? key, required this.router}) : super(key: key);

  @override
  State<AudioPlayerApp> createState() => _AudioPlayerAppState();
}

class _AudioPlayerAppState extends State<AudioPlayerApp> {
  @override
  void dispose() {
    context.read<TabBarBloc>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FavoriteProvider>(
          create: (context) {
            final FavoriteProvider provider = GetIt.I.get();
            provider.loadFavorites();
            return provider;
          },
        ),
        ChangeNotifierProvider<RecentlySearchedProvider>(
          create: (context) {
            final RecentlySearchedProvider provider = GetIt.I.get();
            provider.loadRecentlySearched();
            return provider;
          },
        ),
        ChangeNotifierProvider<RecentlyPlayedIdProvider>(
          create: (context) => RecentlyPlayedIdProvider(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: widget.router,
        theme: ThemeData(
            splashColor: Colors.transparent,
            textTheme: TextTheme(
              titleLarge: TextStyle(
                  color: AppColors.white.color,
                  fontSize: 30,
                  fontFamily: AppFonts.lusitana.font,
                  fontWeight: FontWeight.w400),
              titleMedium: TextStyle(
                  color: AppColors.white.color,
                  fontSize: 25,
                  fontFamily: AppFonts.lusitana.font,
                  fontWeight: FontWeight.w400),
              titleSmall: TextStyle(
                  color: AppColors.white.color,
                  fontSize: 22,
                  fontFamily: AppFonts.lusitana.font,
                  fontWeight: FontWeight.w500),
            ),
            navigationRailTheme: const NavigationRailThemeData(
              indicatorColor: Colors.transparent,
            ),
            primarySwatch: Colors.pink,
            highlightColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            hoverColor: Colors.transparent),
      ),
    );
  }
}
