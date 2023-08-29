import 'package:audio_player/databases/database.dart';
import 'package:audio_player/screens/screens_export.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailAlbumListView extends StatelessWidget {
  const DetailAlbumListView({
    super.key,
    required this.songList,
    required ScrollController scrollController,
    required this.maxWidth,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;
  final double maxWidth;
  final List<DetailAlbum> songList;

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: _scrollController,
      scrollDirection: Axis.vertical,
      children: List.generate(songList.length, (index) {
        final id = songList[index].id;
        return GestureDetector(
          onTap: () {
            GoRouter.of(context).push(
                Uri(path: '${routeNameMap[RouteName.detailMusic]!}$id')
                    .toString());
          },
          child: ResponsiveBuilder(
              narrow: 40.0,
              medium: 52.0,
              large: 52.0,
              builder: (context, child, height) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: height,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '${index + 1}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: AppFonts.lusitana.font,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              ResponsiveBuilder(
                                  narrow: 15.0,
                                  medium: 22.0,
                                  large: 22.0,
                                  builder: (context, child, size) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          TextModifierService().removeTextAfter(
                                              songList[index].title),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily:
                                                  AppFonts.lusitana.font,
                                              fontSize: size * 0.8,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          TextModifierService().removeTextAfter(
                                              songList[index].artistNames),
                                          style: TextStyle(
                                              fontFamily:
                                                  AppFonts.colombia.font,
                                              fontSize: size,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                      ],
                                    );
                                  }),
                            ],
                          ),
                          IconButtonWidget(
                            onPressed: () {},
                            iconData: Icons.keyboard_control,
                            color: Colors.white,
                          ),
                        ]),
                  ),
                );
              }),
        );
      }),
    );
  }
}
