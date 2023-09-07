import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/database.dart';

import 'package:audio_player/screens/tab_bar/index.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecentlyPlayedList extends StatefulWidget {
  const RecentlyPlayedList({
    super.key,
  });

  @override
  State<RecentlyPlayedList> createState() => _RecentlyPlayedListState();
}

class _RecentlyPlayedListState extends State<RecentlyPlayedList> {
  @override
  initState() {
    super.initState();
    BlocProvider.of<RecentlyPlayedBloc>(context)
        .add(FetchRecentlyPlayedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecentlyPlayedBloc, RecentlyPlayedBlocState>(
        builder: (context, state) {
      if (state.recentlyPlayedtList.isEmpty) {
        return const Center(
          child: CustomFadingCircleIndicator(),
        );
      } else {
        final chartItems = state.recentlyPlayedtList;
        return PlatformBuilder(
            web: ImageListView(chartItems: chartItems),
            other: ImageScroll(chartItems: chartItems),
            builder: (context, child, widget) {
              return widget;
            });
      }
    });
  }
}

class ImageListView extends StatefulWidget {
  final List<RecentlyPlayedSong> chartItems;
  const ImageListView({
    required this.chartItems,
    super.key,
  });

  @override
  State<ImageListView> createState() => _ImageListViewState();
}

class _ImageListViewState extends State<ImageListView> {
  final ScrollController _horizontalScroll = ScrollController();

  bool _canScrollBack = false;
  bool _canScrollForward = true;

  @override
  void initState() {
    super.initState();

    _horizontalScroll.addListener(() {
      setState(() {
        _canScrollBack = _horizontalScroll.position.pixels > 0;
        _canScrollForward = _horizontalScroll.position.pixels <
            _horizontalScroll.position.maxScrollExtent;
      });
    });
  }

  @override
  void dispose() {
    _horizontalScroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HoverableWidget(builder: (context, child, isHovered) {
      return Stack(
        children: [
          ListView(
            scrollDirection: Axis.horizontal,
            controller: _horizontalScroll,
            children: List.generate(widget.chartItems.length, (index) {
              return HoverableWidget(builder: (context, child, isHovered) {
                return RecentlyPlayedPageContent(
                    chartItems: widget.chartItems, index: index);
              });
            }),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 60,
            child: CreateScrollButtons(
              canScrollBack: _canScrollBack,
              canScrollForward: _canScrollForward,
              horizontalScroll: _horizontalScroll,
              isHovered: isHovered,
            ),
          ),
        ],
      );
    });
  }
}

class ImageScroll extends StatelessWidget {
  final List<RecentlyPlayedSong> chartItems;
  const ImageScroll({
    required this.chartItems,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        narrow: 190.0,
        medium: 250.0,
        large: 280.0,
        builder: (context, child, height) {
          return SizedBox(
            width: double.infinity,
            height: height,
            child: InfiniteCarousel.builder(
              itemCount: chartItems.length,
              itemExtent: height + 10,
              center: false,
              anchor: 0.5,
              velocityFactor: 0.4,
              onIndexChanged: (index) {},
              controller: InfiniteScrollController(),
              axisDirection: Axis.horizontal,
              loop: true,
              itemBuilder: (context, index, realIndex) {
                return PlatformBuilder(
                    web: RecentlyPlayedPageContent(
                        chartItems: chartItems, index: index),
                    other: GestureDetector(
                      onTap: () {
                        int id = chartItems[index].id;

                        GoRouter.of(context).push(Uri(
                                path:
                                    '/${routeNameMap[RouteName.detailMusic]!}$id')
                            .toString());
                      },
                      child: RecentlyPlayedPageContent(
                          chartItems: chartItems, index: index),
                    ),
                    builder: (context, child, widget) {
                      return widget;
                    });
              },
            ),
          );
        });
  }
}

class RecentlyPlayedPageContent extends StatelessWidget {
  final List<RecentlyPlayedSong> chartItems;
  final int index;

  const RecentlyPlayedPageContent(
      {super.key, required this.chartItems, required this.index});

  @override
  Widget build(BuildContext context) {
    final int id = chartItems[index].id;
    return Builder(builder: (context) {
      return HoverableWidget(builder: (context, child, isHovered) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(
              children: [
                ResponsiveBuilder(
                  narrow: 190.0,
                  medium: 200.0,
                  large: 235.0,
                  builder: (context, child, height) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        height: height,
                        width: height,
                        child: child,
                      ),
                    );
                  },
                  child: Image.network(chartItems[index].headerImageUrl,
                      fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: isHovered
                      ? CreatePlayButton(
                          id: id,
                          size: 45,
                          iconColor: AppColors.white.color,
                          containerColor: AppColors.accent.color,
                        )
                      : Container(),
                ),
              ],
            ),
            ResponsiveBuilder(
                narrow: 15.0,
                medium: 18.0,
                large: 20.0,
                builder: (context, child, size) {
                  return CreateSongTitle(
                    artistName: chartItems[index].artistNames,
                    songTitle: TextModifierService()
                        .capitalizeFirstLetter(chartItems[index].title),
                    maxLines: 2,
                    fontSize: size,
                    minFontSize: 13,
                  );
                }),
          ]),
        );
      });
    });
  }
}
