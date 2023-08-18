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
    final maxWidth = MediaQuery.of(context).size.width;

    return _buildMainStructure(context, maxWidth);
  }

  Widget _buildMainStructure(BuildContext context, double maxWidth) {
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
            _buildRecentlyPlayedSection(maxWidth),
            _buildFavoriteArtistSection(context, maxWidth),
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

  Widget _buildFavoriteArtistSection(BuildContext context, double maxWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Text('Your favorite Artists',
              style: Theme.of(context).textTheme.titleMedium),
        ),
        ResponsiveBuilder(
            narrow: 105.0,
            medium: 150.0,
            large: 185.0,
            builder: (context, child, height) {
              return SizedBox(
                height: height,
                child: const FavoriteArtistList(),
              );
            }),
      ],
    );
  }

  Widget _buildRecentlyPlayedSection(double maxWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Text(
            'Recently played',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        ResponsiveBuilder(
            narrow: 265.0,
            medium: 340.0,
            large: 380.0,
            builder: (context, child, height) {
              return SizedBox(
                height: height,
                child: const Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: RecentlyPlayedList()),
              );
            }),
      ],
    );
  }
}
