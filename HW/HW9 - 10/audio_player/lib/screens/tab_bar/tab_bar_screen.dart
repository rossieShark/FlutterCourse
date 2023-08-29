import 'package:audio_player/app_logic/blocs/bloc_exports.dart';

import 'package:audio_player/screens/tab_bar/go_router.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
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
            provider
                .loadFavorites(); // Load favorites when the provider is created
            return provider;
          },
        ),
        ChangeNotifierProvider<RecentlySearchedProvider>(
          create: (context) {
            final RecentlySearchedProvider provider = GetIt.I.get();
            provider
                .loadRecentlySearched(); // Load favorites when the provider is created
            return provider;
          },
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
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
        ),
      ),
    );
  }
}
