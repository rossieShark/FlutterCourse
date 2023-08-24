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
    final maxWidth = MediaQuery.of(context).size.width;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FavoriteProvider>(
          create: (context) {
            final provider = GetIt.I<FavoriteProvider>();
            provider
                .loadFavorites(); // Load favorites when the provider is created
            return provider;
          },
        ),
        ChangeNotifierProvider<RecentlySearchedProvider>(
          create: (context) {
            final provider = GetIt.I<RecentlySearchedProvider>();
            provider
                .loadFavorites(); // Load favorites when the provider is created
            return provider;
          },
        ),

        // Other providers...
      ],
      child: MaterialApp.router(
          routerConfig: router,
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
            ),
          )),
    );
  }
}
