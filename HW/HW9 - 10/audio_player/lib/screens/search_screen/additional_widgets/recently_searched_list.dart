import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/screens/tab_bar/go_router.dart';
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
        ? SizedBox(
            width: width,
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
          )
        : SizedBox(
            width: width,
            height:
                recentlySearched.favoriteSong.length.toDouble() * 70 + 16 * 6,
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
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: SizedBox(
                        height: 70,
                        width: width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: SizedBox(
                                  width: 70,
                                  height: 70,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: width - 60 - 16 * 3 - 32 - 48,
                                          child: Text(
                                            TextModifierService()
                                                .removeTextAfter(
                                                    song.artist_names),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily:
                                                    AppFonts.lusitana.font,
                                                fontSize: size,
                                                fontWeight: FontWeight.w500),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(
                                          TextModifierService()
                                              .removeTextAfter(song.title),
                                          style: TextStyle(
                                              fontFamily:
                                                  AppFonts.colombia.font,
                                              fontSize: size,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                      ]);
                                }),
                            IconButtonWidget(
                              iconData: Icons.keyboard_control,
                              color: AppColors.white.color,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          );
  }
}
