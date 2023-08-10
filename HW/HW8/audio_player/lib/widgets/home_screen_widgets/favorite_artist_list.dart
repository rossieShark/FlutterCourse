import 'package:audio_player/models/models.dart';

import 'package:audio_player/services/services.dart';
import 'package:audio_player/widgets/ui_properties.dart';
import 'package:flutter/material.dart';

class FavoriteArtistList extends StatefulWidget {
  const FavoriteArtistList({
    super.key,
  });

  @override
  State<FavoriteArtistList> createState() => _FavoriteArtistListState();
}

class _FavoriteArtistListState extends State<FavoriteArtistList> {
  final RecentlyPlayedRepository _favoriteArtist = RecentlyPlayedRepository();
  List<ChartItems> _favoriteArtistList = [];
  @override
  initState() {
    super.initState();
    _fetchRecentlyPlayed();
  }

  Future<void> _fetchRecentlyPlayed() async {
    try {
      final favoriteArtist = await _favoriteArtist.getFavoriteArtists();
      setState(() {
        _favoriteArtistList = favoriteArtist;
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

    if (_favoriteArtistList.isEmpty) {
      return const Center(
        child:
            CustomFadingCircleIndicator(), // Customize this indicator as needed
      );
    } else {
      return ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(_favoriteArtistList.length, (index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                      sizeInspector(maxWidth * 0.165) / 2),
                  child: SizedBox(
                    height: sizeInspector(maxWidth * 0.165),
                    width: sizeInspector(maxWidth * 0.165),
                    child: Image.network(
                        _favoriteArtistList[index].item.image_url ?? '',
                        fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  _favoriteArtistList[index].item.name ?? '',
                  style: TextStyle(
                      fontFamily: AppFonts.colombia.font,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white.color,
                      fontSize: sizeInspector(maxWidth * 0.03)),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          );
        }),
      );
    }
  }
}
