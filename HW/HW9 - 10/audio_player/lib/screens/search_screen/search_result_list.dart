import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/models/models.dart';
import 'package:audio_player/screens/tab_bar/go_router.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchResultlist extends StatelessWidget {
  final double width;

  const SearchResultlist({super.key, required this.width});
  final bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    final recentlySearched =
        Provider.of<RecentlySearchedProvider>(context, listen: false);
    return BlocBuilder<SearchResultBloc, SearchResultState>(
        builder: (context, state) {
      if (state.searchResulList.isEmpty) {
        return const Center(
          child: CustomFadingCircleIndicator(),
        );
      } else {
        final searchResult = state.searchResulList;
        return searchResult.isEmpty
            ? SizedBox(
                height: MediaQuery.of(context).size.height,
                width: width,
                child: Center(
                    child: Text(
                  'No results',
                  style: TextStyle(color: AppColors.white.color, fontSize: 25),
                )))
            : ResponsiveBuilder(
                narrow: 70.0,
                medium: 80.0,
                large: 80.0,
                builder: (context, child, height) {
                  const double padding = 16;
                  return SizedBox(
                    width: width,
                    height: (height + padding) * searchResult.length.toDouble(),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      children: List.generate(searchResult.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            int id = searchResult[index].result.id;

                            GoRouter.of(context).push(Uri(
                                    path:
                                        '${routeNameMap[RouteName.detailMusic]!}$id')
                                .toString());

                            recentlySearched.addToFavorites(SongModel(
                              id: id.toString(),
                              artist_names:
                                  searchResult[index].result.artistNames ?? '',
                              title: searchResult[index].result.title ?? '',
                              header_image_url:
                                  searchResult[index].result.imageUrl ?? '',
                            ));
                          },
                          child: HoverableWidget(
                            builder: (context, child, isHovered) {
                              return AnimatedScale(
                                scale: isHovered ? 1.02 : 1.0,
                                duration: const Duration(milliseconds: 200),
                                child: child,
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  padding, 0, padding, 0),
                              child: SizedBox(
                                height: height,
                                width: width,
                                child: Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 0, padding, 0),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(padding / 2),
                                      child: SizedBox(
                                        width: height - 10,
                                        height: height - 10,
                                        child: Image.network(
                                            searchResult[index]
                                                    .result
                                                    .imageUrl ??
                                                'https://static.dezeen.com/uploads/2020/06/architects-designers-racial-justice-george-floyd-protests-dezeen-sq-a.jpg',
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width:
                                            width - (height - 10) - padding * 7,
                                        child: Text(
                                          searchResult[index].result.title ??
                                              '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                          TextModifierService().removeTextAfter(
                                              searchResult[index]
                                                  .result
                                                  .artistNames!),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        padding, 0, 0, 0),
                                    child: IconButtonWidget(
                                        iconData: Icons.keyboard_control,
                                        color: AppColors.white.color,
                                        onPressed: () {}),
                                  ),
                                ]),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  );
                });
      }
    });
  }
}
