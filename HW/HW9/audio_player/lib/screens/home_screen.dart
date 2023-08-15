import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/widgets/home_screen_widgets/home_screen_exports.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      _scrollListener();
    });
    BlocProvider.of<AlbumBloc>(context).add(FetchAlbumsEvent());
  }

  void _scrollListener() {
    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent - 200) {
      final albumBloc = BlocProvider.of<AlbumBloc>(context);
      albumBloc.add(FetchAlbumsEvent());
    }
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
      return isIpad ? size * 1 : size * 1.5;
    }

    return _buildMainStructure(context, sizeInspector, maxWidth);
  }

  Widget _buildMainStructure(BuildContext context,
      double Function(double size) sizeInspector, double maxWidth) {
    return Scaffold(
      backgroundColor: AppColors.background.color,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButtonWidget(
          iconData: Icons.search,
          color: AppColors.accent.color,
          onPressed: () {
            context.go('/search');
          },
        ),
        actions: [
          IconButtonWidget(
              iconData: Icons.settings,
              color: AppColors.accent.color,
              onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _buildRecentlyPlayedSection(sizeInspector, maxWidth),
            _buildFavoriteArtistSection(context, sizeInspector, maxWidth),
            const SizedBox(
              height: 15,
            ),
            _buildBestAlbumsSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBestAlbumsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 6, 16, 10),
          child: Text('Best albums',
              style: Theme.of(context).textTheme.titleMedium),
        ),
        BlocBuilder<AlbumBloc, AlbumState>(builder: (context, state) {
          if (state.feed.isEmpty) {
            return const Center(
              child: CustomFadingCircleIndicator(),
            );
          } else {
            final albumList = state.feed;
            return BestAlbumList(bestAlbumList: albumList);
          }
        })
      ],
    );
  }

  Widget _buildFavoriteArtistSection(BuildContext context,
      double Function(double size) sizeInspector, double maxWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 5, 16, 16),
          child: Text('Your favorite Artists',
              style: Theme.of(context).textTheme.titleMedium),
        ),
        SizedBox(
          height: sizeInspector(maxWidth * 0.23),
          child: const FavoriteArtistList(),
        ),
      ],
    );
  }

  Widget _buildRecentlyPlayedSection(
      double Function(double size) sizeInspector, double maxWidth) {
    return Column(
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
          height: sizeInspector(maxWidth * 0.45),
          child: const Padding(
              padding: EdgeInsets.all(8.0), child: RecentlyPlayedList()),
        ),
      ],
    );
  }
}
