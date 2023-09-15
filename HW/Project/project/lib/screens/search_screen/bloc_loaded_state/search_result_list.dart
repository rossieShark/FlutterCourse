import 'package:project/app_logic/blocs/bloc_exports.dart';
import 'package:project/models/models.dart';
import 'package:project/screens/tab_bar/index.dart';
import 'package:project/widgets/image_widget.dart';
import 'package:project/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchListView extends StatefulWidget {
  const SearchListView({
    super.key,
    required this.searchResult,
  });
  final List<SearchData> searchResult;

  @override
  State<SearchListView> createState() => _SearchListViewState();
}

class _SearchListViewState extends State<SearchListView> {
  late RecentlySearchedBloc recentlySearchedBloc;
  final double tabBarWidth = 51;
  final double padding = 16;

  SearchResultBloc get searchBloc => BlocProvider.of<SearchResultBloc>(context);
  @override
  void initState() {
    super.initState();

    recentlySearchedBloc = RecentlySearchedBloc(
      Provider.of<RecentlySearchedProvider>(context, listen: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecentlySearchedBloc, RecentlySearchedState>(
        builder: (context, state) {
      final width = MediaQuery.of(context).size.width;
      return ResponsiveBuilder(
          narrow: width,
          medium: width - tabBarWidth,
          large: width - tabBarWidth,
          builder: (context, child, widthVal) {
            return SizedBox(
              width: widthVal,
              height: (80 + padding) * widget.searchResult.length.toDouble(),
              child: ListView(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(widget.searchResult.length, (index) {
                  return HoverableWidget(builder: (context, child, isHovered) {
                    return GestureDetector(
                      onTap: () {
                        int id = widget.searchResult[index].id;
                        if ((widget.searchResult[index].type == 'track') &&
                            !isHovered) {
                          GoRouter.of(context).push(Uri(
                                  path:
                                      '/${routeNameMap[RouteName.detailMusic]!}$id')
                              .toString());

                          recentlySearchedBloc.add(AddToRecentlySearchedEvent(
                            SongModel(
                              type: widget.searchResult[index].type,
                              id: id.toString(),
                              artistNames:
                                  widget.searchResult[index].artist.name,
                              title: widget.searchResult[index].title,
                              image: widget.searchResult[index].artist.image,
                            ),
                          ));
                        } else if ((widget.searchResult[index].type ==
                                'track') &&
                            isHovered) {
                          null;
                        } else {
                          GoRouter.of(context).push(Uri(
                                  path:
                                      '/${routeNameMap[RouteName.albumDetail]!}$id')
                              .toString());

                          recentlySearchedBloc.add(AddToRecentlySearchedEvent(
                            SongModel(
                              type: widget.searchResult[index].type,
                              id: id.toString(),
                              artistNames:
                                  widget.searchResult[index].artist.name,
                              title: widget.searchResult[index].title,
                              image: widget.searchResult[index].artist.image,
                            ),
                          ));
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                        child: CustomListViewContent(
                          imageSection: _CreateImageSection(
                              searchResult: widget.searchResult,
                              index: index,
                              listHeight: 80),
                          titleSection: CreateSongTitle(
                            artistName: widget.searchResult[index].artist.name,
                            songTitle: widget.searchResult[index].title,
                            maxLines: 2,
                          ),
                        ),
                      ),
                    );
                  });
                }),
              ),
            );
          });
    });
  }
}

class _CreateImageSection extends StatelessWidget {
  const _CreateImageSection({
    required this.listHeight,
    required this.searchResult,
    required this.index,
  });

  final double listHeight;
  final List<SearchData> searchResult;
  final int index;

  @override
  Widget build(BuildContext context) {
    RecentlySearchedBloc recentlySearchedBloc = RecentlySearchedBloc(
      Provider.of<RecentlySearchedProvider>(context, listen: false),
    );
    return Stack(
      children: [
        ImageinAlbum(
          size: listHeight,
          image: Image.network(searchResult[index].artist.image,
              fit: BoxFit.cover),
          type: searchResult[index].type,
        ),
        Positioned(
            left: 8,
            bottom: 0,
            top: 0,
            right: 16,
            child: HoverableWidget(builder: (context, child, isHovered) {
              return isHovered
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                          width: listHeight,
                          height: listHeight,
                          color: AppColors.black.color.withOpacity(0.5),
                          child: CreatePlayButton(
                              size: 30,
                              onPressed: () {
                                recentlySearchedBloc
                                    .add(AddToRecentlySearchedEvent(
                                  SongModel(
                                    type: searchResult[index].type,
                                    id: searchResult[index].id.toString(),
                                    artistNames:
                                        searchResult[index].artist.name,
                                    title: searchResult[index].title,
                                    image: searchResult[index].artist.image,
                                  ),
                                ));
                              },
                              id: searchResult[index].id,
                              iconColor: AppColors.white.color,
                              containerColor: Colors.transparent)),
                    )
                  : Container();
            }))
      ],
    );
  }
}
