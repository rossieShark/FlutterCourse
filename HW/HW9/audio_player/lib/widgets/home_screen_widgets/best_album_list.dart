import 'package:audio_player/models/models.dart';
import 'package:audio_player/widgets/widget_exports.dart';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class BestAlbumList extends StatefulWidget {
  final List<ChartItems>? bestAlbumList;
  const BestAlbumList({super.key, required this.bestAlbumList});

  @override
  State<BestAlbumList> createState() => _BestAlbumListState();
}

class _BestAlbumListState extends State<BestAlbumList> {
  @override
  Widget build(BuildContext context) {
    final crossAxisCount = MediaQuery.of(context).size.width ~/ 250;
    final bool isIpad = MediaQuery.of(context).size.width > 600;
    return !isIpad
        ? BestAlbumsListView(bestAlbumList: widget.bestAlbumList!)
        : BestAlbumsGrid(
            crossAxisCount: crossAxisCount,
            bestAlbumList: widget.bestAlbumList!);
  }
}

class BestAlbumsGrid extends StatelessWidget {
  const BestAlbumsGrid({
    Key? key,
    required this.crossAxisCount,
    required this.bestAlbumList,
  }) : super(key: key);

  final int crossAxisCount;
  final List<ChartItems> bestAlbumList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: bestAlbumList.length.toDouble() / crossAxisCount * 100,
      child: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        crossAxisCount: crossAxisCount,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        children: bestAlbumList.asMap().entries.map((entry) {
          final index = entry.key;
          final int id = bestAlbumList[index].item.id;
          final String title =
              textModifier2(bestAlbumList[index].item.full_title ?? '');

          return GestureDetector(
            onTap: () {
              print('tapped');

              context.go(Uri(
                path: '/album_detail/$id',
                queryParameters: {'title': title},
              ).toString());
            },
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                      bestAlbumList[index].item.cover_art_url ?? ''),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Positioned.fill(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          textModifier2(
                              bestAlbumList[index].item.full_title ?? ''),
                          style: Theme.of(context).textTheme.titleSmall),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        textModifier3(
                            bestAlbumList[index].item.full_title ?? ''),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                          bestAlbumList[index].item.release_date_for_display ??
                              '',
                          style: Theme.of(context).textTheme.bodyLarge)
                    ],
                  ),
                )),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class BestAlbumsListView extends StatelessWidget {
  final List<ChartItems> bestAlbumList;

  const BestAlbumsListView({super.key, required this.bestAlbumList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: (150 + 24) * bestAlbumList.length.toDouble(),
      child: ListView(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(bestAlbumList.length, (index) {
          final int id = bestAlbumList[index].item.id;
          final String title =
              textModifier2(bestAlbumList[index].item.full_title ?? '');

          return GestureDetector(
            onTap: () {
              context.go(Uri(
                path: '/album_detail/$id',
                queryParameters: {
                  'title': title
                }, // Add additional parameters here
              ).toString());
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      height: 150,
                      width: MediaQuery.of(context).size.width - 32,
                      child: Image.network(
                        bestAlbumList[index].item.cover_art_url ?? '',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              textModifier2(
                                  bestAlbumList[index].item.full_title ?? ''),
                              style: Theme.of(context).textTheme.titleSmall,
                              textAlign: TextAlign.center),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            textModifier3(
                                bestAlbumList[index].item.full_title ?? ''),
                            style: Theme.of(context).textTheme.bodySmall,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            bestAlbumList[index]
                                    .item
                                    .release_date_for_display ??
                                '',
                            style: Theme.of(context).textTheme.bodyLarge,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
