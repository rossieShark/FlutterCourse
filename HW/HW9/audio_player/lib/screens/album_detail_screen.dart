import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/models/models.dart';
import 'package:audio_player/widgets/responsive_widgets/platform_widget/platform_widget.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AlbumDetailPage extends StatefulWidget {
  final String param;
  final String title;

  const AlbumDetailPage({super.key, required this.param, required this.title});

  @override
  State<AlbumDetailPage> createState() => _AlbumDetailPageState();
}

class _AlbumDetailPageState extends State<AlbumDetailPage> {
  bool isFavorite = false;
  final ScrollController _scrollController = ScrollController();
  bool _isScrolling = false;
  bool _canScrollUp = false;
  bool _canScrollDown = false;

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchAlbumDetails();
    _scrollController.addListener(() {
      setState(() {
        _canScrollUp = _scrollController.position.pixels > 0;
        _canScrollDown = _scrollController.position.pixels <
            _scrollController.position.maxScrollExtent;
      });
    });
  }

  @override
  void didUpdateWidget(covariant AlbumDetailPage oldWidget) {
    if (widget.param != oldWidget.param) {
      _fetchAlbumDetails();
    }
    super.didUpdateWidget(oldWidget);
  }

  void _fetchAlbumDetails() {
    BlocProvider.of<AlbumDetailBloc>(context).add(
      FetchAlbumDetailBlocEvent(widget.param),
    );
  }

  @override
  void didChangeDependencies() {
    final favoriteProvider =
        Provider.of<FavoriteProvider>(context, listen: false);
    isFavorite = favoriteProvider.containsAlbum(widget.param);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<AlbumDetailBloc, AlbumDetailBlocState>(
        builder: (context, state) {
      if (state.albumDetailList.isEmpty) {
        return const Center(
          child: CustomFadingCircleIndicator(),
        );
      } else {
        final songList = state.albumDetailList;
        return MouseRegion(
            onEnter: (_) {
              setState(() {
                _isScrolling = true;
              });
            },
            onExit: (_) {
              setState(() {
                _isScrolling = false;
              });
            },
            child: Scaffold(
              backgroundColor: Colors.black,
              body: songList.isEmpty
                  ? const NoDataWidget()
                  : (List<AlbumAppearances> songList, BuildContext context) {
                      final maxHeight = MediaQuery.of(context).size.height;

                      double pageSize =
                          maxHeight / 2 - 100 + songList.length.toInt() * 66;

                      return Stack(children: [
                        Image.asset(
                          'assets/images/black.jpg',
                          fit: BoxFit.fill,
                          width: double.infinity,
                          height: pageSize,
                        ),
                        ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: <Color>[
                                const Color.fromARGB(255, 255, 255, 255),
                                Colors.white.withOpacity(0),
                              ],
                              tileMode: TileMode.decal,
                            ).createShader(bounds);
                          },
                          child: Image.network(
                            songList.isEmpty
                                ? 'https://static.dezeen.com/uploads/2020/06/architects-designers-racial-justice-george-floyd-protests-dezeen-sq-a.jpg'
                                : songList[0].song.song_art_image_url!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height / 2,
                          ),
                        ),
                        _buildCustomAppBar(context, songList),
                        Positioned.fill(
                          top: MediaQuery.of(context).size.height / 2 - 50,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ListViewWidget(
                                scrollController: _scrollController,
                                maxWidth: maxWidth,
                                songList: songList),
                          ),
                        ),
                        _buildScrollButtons(context)
                      ]);
                    }(songList, context),
            ));
      }
    });
  }

  Widget _buildCustomAppBar(
      BuildContext context, List<AlbumAppearances> songList) {
    final favoriteProvider =
        Provider.of<FavoriteProvider>(context, listen: false);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PlatformBuilder(
                  web: ResponsiveButton(
                      iconData: Icons.search,
                      onPressed: () {
                        context.go('/search');
                      },
                      color: AppColors.white.color),
                  iOS: ResponsiveButton(
                      iconData: Icons.arrow_back_ios,
                      onPressed: () {
                        GoRouter.of(context).push('/');
                      },
                      color: AppColors.white.color),
                  other: ResponsiveButton(
                      iconData: Icons.arrow_back,
                      onPressed: () {
                        GoRouter.of(context).push('/');
                      },
                      color: AppColors.white.color),
                  builder: (context, child, data) {
                    return IconButtonWidget(
                        iconData: data.iconData,
                        color: data.color,
                        onPressed: data.onPressed);
                  }),
              LikeButton(
                onPressed: () {
                  setState(() {
                    _toggleFavorite();
                    if (isFavorite) {
                      favoriteProvider.addToFavoritesAlbum(SongModel(
                        id: widget.param,
                        artist_names: widget.title,
                        title: songList[0].song.artist_names ?? '',
                        header_image_url:
                            songList[0].song.header_image_url ?? '',
                      ));
                    } else {
                      favoriteProvider.removeFromFavoritesAlbum(SongModel(
                        id: widget.param,
                        artist_names: widget.title,
                        title: songList[0].song.artist_names ?? '',
                        header_image_url:
                            songList[0].song.header_image_url ?? '',
                      ));
                    }
                  });
                },
                isFavorite: isFavorite,
                color: AppColors.white.color,
              ),
            ],
          ),
          _buildPlayButton(context),
        ]),
      ),
    );
  }

  Widget _buildPlayButton(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: MediaQuery.of(context).size.height / 2 - 150,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ResponsiveBuilder(
            narrow: 50.0,
            medium: 60.0,
            large: 60.0,
            builder: (context, child, height) {
              return Container(
                height: height,
                width: height,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: IconButtonWidget(
                  onPressed: () {},
                  iconData: Icons.play_arrow,
                  size: height / 2,
                  color: AppColors.black.color,
                ),
              );
            }),
      ),
    );
  }

  Widget _buildScrollButtons(BuildContext context) {
    return Positioned.fill(
        top: MediaQuery.of(context).size.height / 2 - 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _canScrollUp && _isScrolling
                ? IconButton(
                    icon: const Icon(Icons.arrow_upward),
                    color: Colors.white,
                    onPressed: () {
                      _scrollController.animateTo(
                        _scrollController.offset - 100,
                        curve: Curves.linear,
                        duration: const Duration(milliseconds: 300),
                      );
                    },
                  )
                : Container(),
            if (_canScrollDown && _isScrolling)
              IconButton(
                icon: const Icon(Icons.arrow_downward),
                color: Colors.white,
                onPressed: () {
                  _scrollController.animateTo(
                    _scrollController.offset + 100,
                    curve: Curves.linear,
                    duration: const Duration(milliseconds: 300),
                  );
                },
              ),
          ],
        ));
  }
}

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    super.key,
    required this.songList,
    required ScrollController scrollController,
    required this.maxWidth,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;
  final double maxWidth;
  final List<AlbumAppearances> songList;

  @override
  Widget build(BuildContext context) {
    return ListView(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        children: List.generate(songList.length, (index) {
          final id = songList[index].song.id;
          return GestureDetector(
            onTap: () {
              context.go(Uri(path: '/detail_music/$id').toString());
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: getResponsiveSize(maxWidth, 40),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('${index + 1}',
                              style: Theme.of(context).textTheme.bodyMedium),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                  textModifier1(
                                      songList[index].song.title ?? ''),
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              Text(
                                  textModifier1(
                                      songList[index].song.artist_names ?? ''),
                                  style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                        ],
                      ),
                      IconButtonWidget(
                        onPressed: () {},
                        iconData: Icons.keyboard_control,
                        color: Colors.white,
                      ),
                    ]),
              ),
            ),
          );
        }));
  }
}

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: IconButtonWidget(
                iconData: Icons.arrow_back,
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop(true);
                }),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 3 * 2,
            color: Colors.black,
            child: const Center(
              child: Text(
                'No data',
                style: TextStyle(color: Colors.white, fontSize: 60),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
