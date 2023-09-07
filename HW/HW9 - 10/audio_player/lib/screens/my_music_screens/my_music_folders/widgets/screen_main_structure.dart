import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/models/models.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FavoritePageStructure extends StatelessWidget {
  const FavoritePageStructure({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.background.color,
      appBar: AppBar(
        backgroundColor: AppColors.background.color,
        leading: PlatformBuilder(
            iOS: ResponsiveButton(
                iconData: Icons.arrow_back_ios,
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                color: AppColors.white.color),
            other: ResponsiveButton(
                iconData: Icons.arrow_back,
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                color: AppColors.white.color),
            builder: (context, child, data) {
              return IconButtonWidget(
                  iconData: data.iconData,
                  color: data.color,
                  onPressed: data.onPressed);
            }),
        actions: [
          IconButtonWidget(
              iconData: Icons.filter_list_alt,
              color: AppColors.accent.color,
              onPressed: () {
                favoriteProvider.toggleSortSong();
              })
        ],
      ),
      body: Padding(padding: const EdgeInsets.all(16.0), child: child),
    );
  }
}

class FavoriteBody extends StatelessWidget {
  final List<SongModel> songs;
  final Widget child;
  const FavoriteBody({
    super.key,
    required this.songs,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return songs.isEmpty
        ? Center(
            child: Text(
            'No Songs yet',
            style: TextStyle(
                color: AppColors.white.color,
                fontSize: 20,
                fontFamily: AppFonts.colombia.font,
                fontWeight: FontWeight.w700),
          ))
        : child;
  }
}
