import 'package:audio_player/app_logic/blocs/home_screen_bloc/home_screen_bloc.dart';
import 'package:audio_player/app_logic/blocs/home_screen_bloc/home_screen_events.dart';
import 'package:audio_player/app_logic/blocs/home_screen_bloc/home_screen_states.dart';
import 'package:audio_player/databases/database.dart';
import 'package:audio_player/screens/screens_export.dart';

import 'package:audio_player/widgets/responsive_widgets/platform_widget/platform_widget.dart';

import 'package:audio_player/widgets/widget_exports.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

class ImageListView extends StatelessWidget {
  final List<RecentlyPlayedSong> chartItems;
  const ImageListView({
    required this.chartItems,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(chartItems.length, (index) {
        return RecentlyPlayedPageContent(chartItems: chartItems, index: index);
      }),
    );
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
                return RecentlyPlayedPageContent(
                    chartItems: chartItems, index: index);
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
    final maxWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        print('tapped');
        int id = chartItems[index].id;

        GoRouter.of(context).push(
            Uri(path: '${routeNameMap[RouteName.detailMusic]!}$id').toString());
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ResponsiveBuilder(
              narrow: 190.0,
              medium: 250.0,
              large: 280.0,
              builder: (context, child, height) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    height: height,
                    width: height,
                    child: Image.network(chartItems[index].headerImageUrl,
                        fit: BoxFit.cover),
                  ),
                );
              }),
          ResponsiveBuilder(
              narrow: 16.0,
              medium: 22.0,
              large: 22.0,
              builder: (context, child, size) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                  child: Text(
                    chartItems[index].artistNames,
                    style: TextStyle(
                        fontFamily: AppFonts.colombia.font,
                        fontSize: size,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                );
              }),
          const SizedBox(
            height: 4,
          ),
          SizedBox(
            width: getResponsiveSize(maxWidth, 100),
            child: ResponsiveBuilder(
                narrow: 12.0,
                medium: 16.0,
                large: 16.0,
                builder: (context, child, size) {
                  return Text(
                    chartItems[index].title,
                    style: TextStyle(
                        fontFamily: AppFonts.montserrat.font,
                        fontSize: size,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 123, 123, 123)),
                    maxLines: 2,
                  );
                }),
          ),
        ]),
      ),
    );
  }
}
