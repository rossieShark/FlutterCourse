import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/models/favorite_song_model.dart';
import 'package:audio_player/screens/screens_export.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecentlySearchedList extends StatelessWidget {
  final double width;
  const RecentlySearchedList({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final recentlySearched = Provider.of<RecentlySearchedProvider>(context);

    return recentlySearched.favoriteSong.isEmpty
        ? _CreateListEmptyState(width: width)
        : _CreateListView(width: width, recentlySearched: recentlySearched);
  }
}

class _CreateListView extends StatelessWidget {
  const _CreateListView({
    required this.width,
    required this.recentlySearched,
  });

  final double width;

  final RecentlySearchedProvider recentlySearched;

  @override
  Widget build(BuildContext context) {
    const double tabBarWidth = 51;
    const double padding = 16;
    const double listHeight = 70;
    return ResponsiveBuilder(
        narrow: width,
        medium: width - tabBarWidth,
        large: width - tabBarWidth,
        builder: (context, child, widthVal) {
          return SizedBox(
            width: widthVal,
            height:
                recentlySearched.favoriteSong.length.toDouble() * listHeight +
                    padding * 6,
            child: ListView.separated(
                itemCount: recentlySearched.favoriteSong.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final song = recentlySearched.favoriteSong[index];

                  return GestureDetector(
                    onTap: () {
                      String id = song.id;
                      GoRouter.of(context).push(Uri(
                              path:
                                  '${routeNameMap[RouteName.detailMusic]!}$id')
                          .toString());
                    },
                    child: _CreateListViewContent(
                        listHeight: listHeight, song: song, widthVal: widthVal),
                  );
                }),
          );
        });
  }
}

class _CreateListViewContent extends StatelessWidget {
  const _CreateListViewContent({
    required this.listHeight,
    required this.widthVal,
    required this.song,
  });

  final double listHeight;
  final double widthVal;
  final SongModel song;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: SizedBox(
        height: listHeight,
        width: widthVal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                      width: listHeight,
                      height: listHeight,
                      child: Image.network(
                        song.header_image_url,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                ResponsiveBuilder(
                    narrow: 13.0,
                    medium: 20.0,
                    large: 20.0,
                    builder: (context, child, size) {
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              TextModifierService()
                                  .removeTextAfter(song.artist_names),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: AppFonts.lusitana.font,
                                  fontSize: size,
                                  fontWeight: FontWeight.w500),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              TextModifierService().removeTextAfter(song.title),
                              style: TextStyle(
                                  fontFamily: AppFonts.colombia.font,
                                  fontSize: size,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ]);
                    }),
              ],
            ),
            IconButtonWidget(
              iconData: Icons.keyboard_control,
              color: AppColors.white.color,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _CreateListEmptyState extends StatelessWidget {
  const _CreateListEmptyState({
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    const double tabBarWidth = 51;
    return ResponsiveBuilder(
        narrow: width,
        medium: width - tabBarWidth,
        large: width - tabBarWidth,
        builder: (context, child, widthVal) {
          return SizedBox(
            width: widthVal,
            height: MediaQuery.of(context).size.height,
            child: ResponsiveBuilder(
                narrow: 13.0,
                medium: 18.0,
                large: 18.0,
                builder: (context, child, size) {
                  return Text(
                    'Search history is empty',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: AppFonts.lusitana.font,
                        fontSize: size,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  );
                }),
          );
        });
  }
}
