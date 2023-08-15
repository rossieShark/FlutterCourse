import 'package:audio_player/app_logic/blocs/home_screen_bloc.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/foundation.dart';
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
    final maxWidth = MediaQuery.of(context).size.width;

    bool isIpad = maxWidth > 600;
    double sizeInspector(double size) {
      return isIpad
          ? size * 1
          : kIsWeb
              ? size * 0.5
              : size * 1.5;
    }

    return BlocBuilder<RecentlyPlayedBloc, RecentlyPlayedBlocState>(
        builder: (context, state) {
      if (state.recentlyPlayedtList.isEmpty) {
        return const Center(
          child: CustomFadingCircleIndicator(),
        );
      } else {
        final chartItems = state.recentlyPlayedtList;
        return ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(chartItems.length, (index) {
            return GestureDetector(
              onTap: () {
                print('tapped');
                int id = chartItems[index].item.id;

                context.go(Uri(path: '/detail_music/$id').toString());
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        height: sizeInspector(maxWidth * 0.3),
                        width: sizeInspector(maxWidth * 0.3),
                        child: Image.network(
                            chartItems[index].item.header_image_url ?? '',
                            fit: BoxFit.cover),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                      child: Text(
                        chartItems[index].item.artist_names ?? '',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    SizedBox(
                      width: sizeInspector(maxWidth * 0.3),
                      child: Text(
                        chartItems[index].item.title ?? "",
                        style: Theme.of(context).textTheme.displaySmall,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        );
      }
    });
  }
}
