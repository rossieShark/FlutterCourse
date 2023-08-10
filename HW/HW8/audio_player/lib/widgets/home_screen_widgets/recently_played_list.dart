import 'package:audio_player/models/models.dart';

import 'package:audio_player/services/services.dart';
import 'package:audio_player/widgets/ui_properties.dart';

import 'package:flutter/cupertino.dart';
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
  final RecentlyPlayedRepository _recentlyPlayedRepository =
      RecentlyPlayedRepository();
  List<ChartItems> _chartItems = [];
  @override
  initState() {
    super.initState();
    _fetchRecentlyPlayed();
  }

  Future<void> _fetchRecentlyPlayed() async {
    try {
      final recentlyPlayed = await _recentlyPlayedRepository.getTracks();
      setState(() {
        _chartItems = recentlyPlayed;
      });
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    bool isIpad = maxWidth > 600;
    double sizeInspector(double size) {
      return isIpad ? size * 1 : size * 1.3;
    }

    if (_chartItems.isEmpty) {
      return const Center(
        child: CustomFadingCircleIndicator(),
      );
    } else {
      return ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(_chartItems.length, (index) {
          return GestureDetector(
            onTap: () {
              print('tapped');
              int id = _chartItems[index].item.id;
              context.go('/detail_music/$id');
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
                          _chartItems[index].item.header_image_url ?? '',
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                    child: Text(
                      _chartItems[index].item.artist_names ?? '',
                      style: TextStyle(
                          fontFamily: AppFonts.colombia.font,
                          fontSize: sizeInspector(maxWidth * 0.03),
                          fontWeight: FontWeight.w600,
                          color: AppColors.white.color),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    _chartItems[index].item.title ?? "",
                    style: TextStyle(
                        fontFamily: AppFonts.colombia.font,
                        fontSize: sizeInspector(maxWidth * 0.025),
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 123, 123, 123)),
                  ),
                ],
              ),
            ),
          );
        }),
      );
    }
  }
}
