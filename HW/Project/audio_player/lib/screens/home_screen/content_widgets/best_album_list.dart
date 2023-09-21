import 'package:audio_player/databases/database.dart';
import 'package:audio_player/screens/tab_bar/index.dart';

import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestAlbumList extends StatelessWidget {
  final List<BestAlbum>? bestAlbumList;
  const BestAlbumList({super.key, required this.bestAlbumList});
  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = (maxWidth - maxWidth / 3) ~/ 220;

    return ResponsiveWidget(
      narrow: (context) => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: bestAlbumList!.length.toDouble() * (150 + 26),
        child: ListView(
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(bestAlbumList!.length, (index) {
            return BestAlbumsContent(
                bestAlbumList: bestAlbumList!, index: index);
          }),
        ),
      ),
      other: (context) => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: bestAlbumList!.length.toDouble() / crossAxisCount * 220,
        child: GridView.count(
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 16,
          mainAxisSpacing: 8,
          crossAxisCount: crossAxisCount,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          children: bestAlbumList!.asMap().entries.map((entry) {
            final index = entry.key;
            return BestAlbumsContent(
                bestAlbumList: bestAlbumList!, index: index);
          }).toList(),
        ),
      ),
    );
  }
}

class BestAlbumsContent extends StatelessWidget {
  final List<BestAlbum> bestAlbumList;
  final int index;

  const BestAlbumsContent(
      {super.key, required this.bestAlbumList, required this.index});
  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final int id = bestAlbumList[index].id;
    final image = bestAlbumList[index].image;
    final title = bestAlbumList[index].title;
    final artist = bestAlbumList[index].artist;
    return GestureDetector(
      onTap: () {
        print('Navigating to album detail with id: $id and title: $image');

        GoRouter.of(context).push(Uri(
          path: '/${routeNameMap[RouteName.albumDetail]!}$id',
          queryParameters: {'image': image, 'title': title, 'artist': artist},
        ).toString());
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: HoverableWidget(
          builder: (context, child, isHovered) {
            return AnimatedScale(
              scale: isHovered ? 1.06 : 1.0,
              duration: const Duration(milliseconds: 200),
              child: child,
            );
          },
          child: HoverableWidget(builder: (context, child, isHovered) {
            return Stack(children: [
              ResponsiveBuilder(
                narrow: 150.0,
                medium: 350.0,
                large: 350.0,
                builder: (context, child, height) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                        height: height, width: maxWidth - 32, child: child),
                  );
                },
                child: Image.network(
                  bestAlbumList[index].image,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: isHovered
                        ? Colors.black.withOpacity(0.1)
                        : Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Positioned.fill(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CreateSongTitle(
                        artistName: bestAlbumList[index].title,
                        songTitle: bestAlbumList[index].artist,
                        maxLines: 3,
                        minFontSize: 13,
                        fontSize: 24,
                        crossAxisAlignment: CrossAxisAlignment.center)),
              ),
            ]);
          }),
        ),
      ),
    );
  }
}
