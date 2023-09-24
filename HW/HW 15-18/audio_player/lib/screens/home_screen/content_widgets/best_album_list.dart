import 'package:audio_player/databases/database.dart';

import 'package:audio_player/screens/tab_bar/index.dart';

import 'package:audio_player/widgets/widget_exports.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
        height: bestAlbumList!.length.toDouble() * (220 + 26),
        child: ListView(
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(bestAlbumList!.length, (index) {
            return BestAlbumsContent(
                id: bestAlbumList![index].id,
                image: bestAlbumList![index].image,
                artist: bestAlbumList![index].artist,
                title: bestAlbumList![index].title);
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
                id: bestAlbumList![index].id,
                image: bestAlbumList![index].image,
                artist: bestAlbumList![index].artist,
                title: bestAlbumList![index].title);
          }).toList(),
        ),
      ),
    );
  }
}

class BestAlbumsContent extends StatelessWidget {
  final int id;
  final String image;
  final String title;
  final String artist;

  const BestAlbumsContent(
      {super.key,
      required this.id,
      required this.artist,
      required this.image,
      required this.title});
  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;

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
                narrow: 220.0,
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
                  image,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        TextModifierService().removeTextAfter(
                          artist,
                        ),
                        style: TextStyle(
                            color: AppColors.white.color,
                            fontSize: 30,
                            fontFamily: AppFonts.lusitana.font,
                            fontWeight: FontWeight.w600),
                        maxFontSize: 15,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      Text(
                        TextModifierService().removeTextAfter(title),
                        style: TextStyle(
                            fontFamily: AppFonts.colombia.font,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ]);
          }),
        ),
      ),
    );
  }
}
