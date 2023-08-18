import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
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
            child: Text(
              'Search history is empty',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ))
        : SizedBox(
            width: width,
            height: MediaQuery.of(context).size.height,
            child: ListView.separated(
              itemCount: recentlySearched.favoriteSong.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final song = recentlySearched.favoriteSong[index];

                return GestureDetector(
                  onTap: () {
                    String id = song.id;
                    context.go(Uri(path: '/detail_music/$id').toString());
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: width - 60 - 16 * 3 - 32 - 48,
                                child: Text(
                                  textModifier1(song.artist_names),
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                textModifier1(song.title),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
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
                  ),
                );
              },
            ));
  }
}
