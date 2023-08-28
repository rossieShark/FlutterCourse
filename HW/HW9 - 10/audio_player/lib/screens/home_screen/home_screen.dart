import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/screens/home_screen/additional_widgets/index.dart';
import 'package:audio_player/screens/screens_export.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background.color,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButtonWidget(
          iconData: Icons.search,
          color: AppColors.accent.color,
          onPressed: () {
            context.go(routeNameMap[RouteName.search]!);
          },
        ),
        actions: [
          IconButtonWidget(
              iconData: Icons.settings,
              color: AppColors.accent.color,
              onPressed: () {})
        ],
      ),
      body: _BuildMainSection(),
    );
  }
}

class _BuildMainSection extends StatefulWidget {
  @override
  State<_BuildMainSection> createState() => _BuildMainSectionState();
}

class _BuildMainSectionState extends State<_BuildMainSection> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      _scrollListener();
    });
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
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          _BuildRecentlyPlayedSection(),
          _BuildFavoriteArtistSection(),
          const SizedBox(
            height: 15,
          ),
          _BuildBestAlbumsSection(),
        ],
      ),
    );
  }
}

class _BuildRecentlyPlayedSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            narrow: 266.0,
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

class _BuildFavoriteArtistSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}

class _BuildBestAlbumsSection extends StatefulWidget {
  @override
  State<_BuildBestAlbumsSection> createState() =>
      _BuildBestAlbumsSectionState();
}

class _BuildBestAlbumsSectionState extends State<_BuildBestAlbumsSection> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AlbumBloc>(context).add(FetchAlbumsEvent());
  }

  @override
  Widget build(BuildContext context) {
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
}
