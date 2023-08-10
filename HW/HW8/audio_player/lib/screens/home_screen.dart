import 'package:audio_player/models/models.dart';
import 'package:audio_player/services/services.dart';
import 'package:audio_player/widgets/home_screen_widgets/home_screen_exports.dart';
import 'package:audio_player/widgets/ui_properties.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BestAlbumsPaginationService _service = BestAlbumsPaginationService();
  final ScrollController _scrollController = ScrollController();
  List<ChartItems> get _feed => _service.items;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      _scrollListener();
    });
    _loadAlbums();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent - 200) {
      if (!_service.isLoading) {
        print('loading more popular items');
        _loadAlbums();
      }
    }
  }

  Future<void> _loadAlbums() async {
    await _service.loadMoreItems();
    print('load more data');
    setState(() {});
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isIpad = MediaQuery.of(context).size.width > 600;
    final maxWidth = MediaQuery.of(context).size.width;
    double sizeInspector(double size) {
      return isIpad ? size * 1 : size * 1.3;
    }

    return Scaffold(
      backgroundColor: AppColors.background.color,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButtonWidget(
          iconData: Icons.search,
          color: AppColors.accent.color,
          onPressed: () {},
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButtonWidget(
                  iconData: Icons.settings,
                  color: AppColors.accent.color,
                  onPressed: () {}),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: Text(
                    'Recently played',
                    style: TextStyle(
                        color: AppColors.white.color,
                        fontSize: sizeInspector(maxWidth * 0.053),
                        fontFamily: AppFonts.lusitana.font,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: sizeInspector(maxWidth * 0.44),
                  child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: RecentlyPlayedList()),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 5, 16, 16),
                  child: Text(
                    'Your favorite Artists',
                    style: TextStyle(
                        color: AppColors.white.color,
                        fontSize: sizeInspector(maxWidth * 0.04),
                        fontFamily: AppFonts.lusitana.font),
                  ),
                ),
                SizedBox(
                  height: sizeInspector(maxWidth * 0.22),
                  child: const FavoriteArtistList(),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 6, 16, 10),
                  child: Text(
                    'Best albums',
                    style: TextStyle(
                      fontSize: sizeInspector(maxWidth * 0.04),
                      fontFamily: AppFonts.lusitana.font,
                      color: AppColors.white.color,
                    ),
                  ),
                ),
                BestAlbumList(bestAlbumList: _feed),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
