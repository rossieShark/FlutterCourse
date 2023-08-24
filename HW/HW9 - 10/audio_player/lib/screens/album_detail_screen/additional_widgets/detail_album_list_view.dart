import 'package:audio_player/databases/database.dart';
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
              GoRouter.of(context)
                  .push(Uri(path: '/detail_music/$id').toString());
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: getResponsiveSize(maxWidth, 40),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('${index + 1}',
                              style: Theme.of(context).textTheme.bodyMedium),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                  TextModifierService()
                                      .removeTextAfter(songList[index].title),
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              Text(
                                  TextModifierService().removeTextAfter(
                                      songList[index].artistNames),
                                  style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                        ],
                      ),
                      IconButtonWidget(
                        onPressed: () {},
                        iconData: Icons.keyboard_control,
                        color: Colors.white,
                      ),
                    ]),
              ),
            ),
          );
        }));
  }
}
