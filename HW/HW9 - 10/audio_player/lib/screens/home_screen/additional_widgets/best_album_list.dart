import 'package:audio_player/databases/database.dart';
import 'package:audio_player/screens/screens_export.dart';

import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:go_router/go_router.dart';

class BestAlbumList extends StatelessWidget {
  final List<BestAlbum>? bestAlbumList;
  const BestAlbumList({super.key, required this.bestAlbumList});
  @override
  Widget build(BuildContext context) {
    final crossAxisCount = MediaQuery.of(context).size.width ~/ 250;

    return ResponsiveWidget(
      narrow: (context) => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: bestAlbumList!.length.toDouble() * 150 + 26,
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
        height: bestAlbumList!.length.toDouble() / crossAxisCount * 200,
        child: GridView.count(
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
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
      // large: (context) => SizedBox(
      //   width: MediaQuery.of(context).size.width,
      //   height: bestAlbumList!.length.toDouble() / crossAxisCount * 200,
      //   child: GridView.count(
      //     padding: const EdgeInsets.all(20),
      //     crossAxisSpacing: 16,
      //     mainAxisSpacing: 16,
      //     crossAxisCount: crossAxisCount,
      //     scrollDirection: Axis.vertical,
      //     physics: const NeverScrollableScrollPhysics(),
      //     children: bestAlbumList!.asMap().entries.map((entry) {
      //       final index = entry.key;
      //       return BestAlbumsContent(
      //           bestAlbumList: bestAlbumList!, index: index);
      //     }).toList(),
      //   ),
      // ),
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
    final int id = bestAlbumList[index].id;
    final String title =
        TextModifierService().removeTextAfter(bestAlbumList[index].title);

    return GestureDetector(
      onTap: () {
        print('Navigating to album detail with id: $id and title: $title');

        GoRouter.of(context).push(Uri(
          path: '${routeNameMap[RouteName.albumDetail]!}$id',
          queryParameters: {'title': title}, // Add additional parameters here
        ).toString());
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: HoverableWidget(
          builder: (context, child, isHovered) {
            return AnimatedScale(
              scale: isHovered ? 1.1 : 1.0,
              duration: const Duration(milliseconds: 200),
              child: child,
            );
          },
          child: Stack(children: [
            ResponsiveBuilder(
                narrow: 150.0,
                medium: 300.0,
                large: 350.0,
                builder: (context, child, height) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      height: height,
                      width: MediaQuery.of(context).size.width - 32,
                      child: Image.network(
                        bestAlbumList[index].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }),
            Positioned.fill(
              child: HoverableWidget(builder: (context, child, isHovered) {
                return Container(
                  decoration: BoxDecoration(
                    color: isHovered
                        ? Colors.black.withOpacity(0.1)
                        : Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                );
              }),
            ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        TextModifierService()
                            .removeTextAfter(bestAlbumList[index].title),
                        style: TextStyle(
                            color: AppColors.white.color,
                            fontSize: 24,
                            fontFamily: AppFonts.lusitana.font,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        minFontSize: 15,
                        stepGranularity: 1,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        TextModifierService()
                            .removeTextBefore(bestAlbumList[index].title),
                        style: TextStyle(
                            fontFamily: AppFonts.colombia.font,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        bestAlbumList[index].releaseDate,
                        style: TextStyle(
                          color: AppColors.white.color,
                          fontSize: 22,
                          fontFamily: AppFonts.colombia.font,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
