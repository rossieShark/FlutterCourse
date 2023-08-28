import 'package:audio_player/app_logic/blocs/bloc_exports.dart';

import 'package:audio_player/models/models.dart';
import 'package:audio_player/screens/screens_export.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchResultlist extends StatelessWidget {
  final double width;

  const SearchResultlist({super.key, required this.width});

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
            ? _NoResultsWidget(width: width)
            : _CreateListView(
                width: width,
                searchResult: searchResult,
                recentlySearched: recentlySearched);
      }
    });
  }
}

class _CreateListView extends StatefulWidget {
  const _CreateListView({
    required this.width,
    required this.searchResult,
    required this.recentlySearched,
  });

  final double width;

  final List<Hits> searchResult;
  final RecentlySearchedProvider recentlySearched;

  @override
  State<_CreateListView> createState() => _CreateListViewState();
}

class _CreateListViewState extends State<_CreateListView> {
  final bool isHovered = false;
  late RecentlySearchedBloc recentlySearchedBloc;
  final double tabBarWidth = 51;

  final double padding = 16;

  final double listHeight = 70;

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
      return ResponsiveBuilder(
          narrow: widget.width,
          medium: widget.width - tabBarWidth,
          large: widget.width - tabBarWidth,
          builder: (context, child, widthVal) {
            return SizedBox(
              width: widthVal,
              height: (listHeight + padding * 2) *
                  widget.searchResult.length.toDouble(),
              child: ListView(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(widget.searchResult.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      int id = widget.searchResult[index].result.id;

                      GoRouter.of(context).push(Uri(
                              path:
                                  '${routeNameMap[RouteName.detailMusic]!}$id')
                          .toString());

                      recentlySearchedBloc.add(AddToRecentlySearchedEvent(
                        SongModel(
                          id: id.toString(),
                          artist_names:
                              widget.searchResult[index].result.artistNames ??
                                  '',
                          title: widget.searchResult[index].result.title ?? '',
                          header_image_url:
                              widget.searchResult[index].result.imageUrl ?? '',
                        ),
                      ));
                    },
                    child: _CreateListViewContent(
                      listHeight: listHeight,
                      padding: padding,
                      searchResult: widget.searchResult,
                      index: index,
                      widthVal: widthVal,
                    ),
                  );
                }),
              ),
            );
          });
    });
  }
}

class _CreateListViewContent extends StatelessWidget {
  const _CreateListViewContent(
      {required this.listHeight,
      required this.padding,
      required this.searchResult,
      required this.index,
      required this.widthVal});

  final double listHeight;
  final double padding;
  final List<Hits> searchResult;
  final double widthVal;
  final int index;

  @override
  Widget build(BuildContext context) {
    return HoverableWidget(
      builder: (context, child, isHovered) {
        return AnimatedScale(
          scale: isHovered ? 1.04 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: child,
        );
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: SizedBox(
          height: listHeight,
          width: widthVal,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(padding / 2),
                    child: SizedBox(
                      width: listHeight,
                      height: listHeight,
                      child: Image.network(
                          searchResult[index].result.imageUrl ??
                              'https://static.dezeen.com/uploads/2020/06/architects-designers-racial-justice-george-floyd-protests-dezeen-sq-a.jpg',
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        searchResult[index].result.title ?? '',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: AppFonts.lusitana.font,
                            fontSize: listHeight * 0.2,
                            fontWeight: FontWeight.w500),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        TextModifierService().removeTextAfter(
                            searchResult[index].result.artistNames!),
                        style: TextStyle(
                            fontFamily: AppFonts.colombia.font,
                            fontSize: listHeight * 0.25,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ]),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: IconButtonWidget(
                  iconData: Icons.keyboard_control,
                  color: AppColors.white.color,
                  onPressed: () {}),
            ),
          ]),
        ),
      ),
    );
  }
}

class _NoResultsWidget extends StatelessWidget {
  const _NoResultsWidget({
    required this.width,
  });

  final double width;

  final double tabBarWidth = 51;
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        narrow: width,
        medium: width - tabBarWidth,
        large: width - tabBarWidth,
        builder: (context, child, widthVal) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            width: width,
            child: Center(
              child: Text(
                'No results',
                style: TextStyle(color: AppColors.white.color, fontSize: 25),
              ),
            ),
          );
        });
  }
}
