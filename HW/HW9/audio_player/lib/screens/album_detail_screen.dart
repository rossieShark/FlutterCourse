import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/models/models.dart';
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

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchAlbumDetails();
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
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumDetailBloc, AlbumDetailBlocState>(
        builder: (context, state) {
      if (state.albumDetailList.isEmpty) {
        return const Center(
          child: CustomFadingCircleIndicator(),
        );
      } else {
        final songList = state.albumDetailList;
        return _buildMainStructure(songList, context);
      }
    });
  }

  Widget _buildMainStructure(
      List<AlbumAppearances> songList, BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: songList.isEmpty
          ? const NoDataWidget()
          : _buildContent(songList, context),
    );
  }

  Widget _buildContent(List<AlbumAppearances> songList, BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;

    final favoriteProvider =
        Provider.of<FavoriteProvider>(context, listen: false);
    double pageSize = maxHeight / 2 - 100 + songList.length.toInt() * 66;

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
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Column(children: [
            _buildTitleSection(context, favoriteProvider, songList),
            _buildPlayButton(context),
          ]),
        ),
      ),
      Positioned.fill(
        top: MediaQuery.of(context).size.height / 2 - 50,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SongsList(songList: songList),
        ),
      )
    ]);
  }

  Widget _buildPlayButton(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.transparent,
      height: MediaQuery.of(context).size.height / 2 - 150,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: getResponsiveSize(maxWidth, 50),
          width: getResponsiveSize(maxWidth, 50),
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: IconButtonWidget(
            onPressed: () {},
            iconData: Icons.play_arrow,
            size: getResponsiveSize(maxWidth, 30),
            color: AppColors.black.color,
          ),
        ),
      ),
    );
  }

  Widget _buildTitleSection(BuildContext context,
      FavoriteProvider favoriteProvider, List<AlbumAppearances> songList) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButtonWidget(
            iconData: Icons.arrow_back,
            color: AppColors.white.color,
            onPressed: () {
              GoRouter.of(context).push('/');
            }),
        IconButtonWidget(
            iconData:
                isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
            color: AppColors.white.color,
            onPressed: () {
              setState(() {
                _toggleFavorite();
                if (isFavorite) {
                  favoriteProvider.addToFavoritesAlbum(SongModel(
                    id: widget.param,
                    artist_names: widget.title,
                    title: songList[0].song.artist_names ?? '',
                    header_image_url: songList[0].song.header_image_url ?? '',
                  ));
                } else {
                  favoriteProvider.removeFromFavorites(SongModel(
                    id: widget.param,
                    artist_names: widget.title,
                    title: songList[0].song.artist_names ?? '',
                    header_image_url: songList[0].song.header_image_url ?? '',
                  ));
                }
              });
            })
      ],
    );
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

class SongsList extends StatelessWidget {
  const SongsList({
    super.key,
    required this.songList,
  });

  final List<AlbumAppearances> songList;

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;

    return ListView(
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
                              Text(songList[index].song.title ?? '',
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
