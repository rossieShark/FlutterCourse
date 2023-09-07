import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/database.dart';
import 'package:audio_player/screens/tab_bar/index.dart';

import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailAlbumListView extends StatefulWidget {
  const DetailAlbumListView({
    super.key,
    required this.songList,
    required this.image,
  });

  final String image;
  final List<DetailAlbum> songList;

  @override
  State<DetailAlbumListView> createState() => _DetailAlbumListViewState();
}

class _DetailAlbumListViewState extends State<DetailAlbumListView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: List.generate(widget.songList.length, (index) {
        final id = widget.songList[index].id;
        return HoverableWidget(builder: (context, child, isHovered) {
          return PlatformBuilder(
              web: _CreateListViewContent(
                image: widget.image,
                songList: widget.songList,
                index: index,
                isHovered: isHovered,
              ),
              other: GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(
                      Uri(path: '/${routeNameMap[RouteName.detailMusic]!}$id')
                          .toString());
                },
                child: _CreateListViewContent(
                    image: widget.image,
                    songList: widget.songList,
                    index: index,
                    isHovered: isHovered),
              ),
              builder: (context, child, widget) {
                return widget;
              });
        });
      }),
    );
  }
}

class _CreateListViewContent extends StatelessWidget {
  const _CreateListViewContent({
    required this.index,
    required this.isHovered,
    required this.image,
    required this.songList,
  });

  final List<DetailAlbum> songList;
  final String image;
  final int index;
  final bool isHovered;

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    return ResponsiveBuilder(
      narrow: 40.0,
      medium: 60.0,
      large: 60.0,
      builder: (context, child, height) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: height,
            child: child,
          ),
        );
      },
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ResponsiveBuilder(
              narrow: maxWidth / 2.8,
              medium: maxWidth / 2.3,
              large: maxWidth / 2,
              builder: (context, child, size) {
                return SizedBox(
                  width: size,
                  child: child,
                );
              },
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: Center(
                    child: !isHovered
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              image,
                              fit: BoxFit.cover,
                            ),
                          )
                        : IconButtonWidget(
                            onPressed: () {
                              final id = songList[index].id;
                              Provider.of<RecentlyPlayedIdProvider>(context,
                                      listen: false)
                                  .setId(id.toString());
                            },
                            color: AppColors.white.color,
                            iconData: Icons.play_arrow),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: CreateSongTitle(
                  artistName: songList[index].artistNames,
                  songTitle: songList[index].title,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                )),
              ]),
            ),
            _CreateManageButtons(
                songList: songList, image: image, index: index),
          ]),
    );
  }
}

class _CreateManageButtons extends StatelessWidget {
  const _CreateManageButtons({
    required this.songList,
    required this.index,
    required this.image,
  });

  final List<DetailAlbum> songList;
  final String image;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LikeButtonWidget(
            id: songList[index].id.toString(),
            artistNames: songList[index].artistNames,
            title: songList[index].title,
            image: image),
        const SizedBox(
          width: 10,
        ),
        IconButtonWidget(
          onPressed: () {},
          iconData: Icons.keyboard_control,
          color: Colors.white,
        ),
      ],
    );
  }
}
