import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/models/models.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class DetailMusicPage extends StatefulWidget {
  final String param;
  const DetailMusicPage({super.key, required this.param});

  @override
  State<DetailMusicPage> createState() => _DetailMusicPageState();
}

class _DetailMusicPageState extends State<DetailMusicPage> {
  late double _sliderValue;
  String _formattedDuration = '00:00';
  final Duration _audioDuration = const Duration(seconds: 15);

  bool isFavorite = false;
  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<DetailMusicPageBloc>(context).add(
      FetchSongDetailEvent(widget.param),
    );
    _sliderValue = 0.0;
  }

  @override
  void didChangeDependencies() {
    final favoriteProvider =
        Provider.of<FavoriteProvider>(context, listen: false);
    isFavorite = favoriteProvider.contains(widget.param);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailMusicPageBloc, DetailMusicPageState>(
        builder: (context, state) {
      if (state.songDetail == null) {
        return const Center(
          child: CustomFadingCircleIndicator(),
        );
      } else {
        final songList = state.songDetail;

        return _buildMusicPage(context, songList!);
      }
    });
  }

  Widget _buildMusicPage(BuildContext context, SongDetail? songInfo) {
    return Scaffold(
      backgroundColor: AppColors.background.color,
      body: SingleChildScrollView(
        child: GestureDetector(
          onVerticalDragUpdate: (details) {
            if (details.delta.dy > 10) {
              Navigator.of(context).pop(true);
            }
          },
          child: _builMainSection(songInfo),
        ),
      ),
    );
  }

  Widget _builMainSection(SongDetail? songInfo) {
    final favoriteProvider =
        Provider.of<FavoriteProvider>(context, listen: false);
    final maxHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        _buildImageSection(songInfo),
        SizedBox(
          height: maxHeight / 2 - 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _createTitleSection(songInfo, favoriteProvider),
              _createSliderSection(),
              _createMusicControlSection(),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _createMusicControlSection() {
    return ResponsiveBuilder(
        narrow: 280.0,
        medium: 320.0,
        large: 320.0,
        builder: (context, child, height) {
          return SizedBox(
            width: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButtonWidget(
                    iconData: Icons.repeat,
                    color: AppColors.accent.color,
                    onPressed: () {}),
                ResponsiveBuilder(
                    narrow: 50.0,
                    medium: 60.0,
                    large: 60.0,
                    builder: (context, child, height) {
                      return Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: height - 15,
                              width: height - 10,
                              decoration: BoxDecoration(
                                  color:
                                      AppColors.white.color.withOpacity(0.1)),
                              child: IconButtonWidget(
                                  iconData: Icons.fast_rewind,
                                  color: AppColors.white.color,
                                  onPressed: () {}),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: height,
                              width: height,
                              decoration:
                                  BoxDecoration(color: AppColors.accent.color),
                              child: IconButtonWidget(
                                  iconData: Icons.play_arrow,
                                  color: AppColors.white.color,
                                  size: height / 2,
                                  onPressed: () {}),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: height - 15,
                              width: height - 10,
                              decoration: BoxDecoration(
                                  color:
                                      AppColors.white.color.withOpacity(0.1)),
                              child: IconButtonWidget(
                                  iconData: Icons.fast_forward,
                                  color: AppColors.white.color,
                                  onPressed: () {}),
                            ),
                          ),
                        ],
                      );
                    }),
                IconButtonWidget(
                    iconData: Icons.shuffle,
                    color: AppColors.accent.color,
                    onPressed: () {}),
              ],
            ),
          );
        });
  }

  Widget _createSliderSection() {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Slider(
            activeColor: AppColors.white.color,
            inactiveColor: AppColors.accent.color,
            thumbColor: AppColors.darkAccent.color,
            value: _sliderValue,
            min: 0.0,
            max: _audioDuration.inMilliseconds.toDouble(),
            onChanged: (newValue) {
              setState(() {
                setState(() {
                  _sliderValue = newValue;
                  _formattedDuration = sliderValueFormatDuration(_sliderValue);
                });
              });
            },
            onChangeEnd: (newValue) {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_formattedDuration,
                  style: Theme.of(context).textTheme.bodySmall),
              Text(sliderFormatDuration(_audioDuration),
                  style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ],
    );
  }

  Widget _createTitleSection(
      SongDetail? songInfo, FavoriteProvider favoriteProvider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButtonWidget(
            iconData: Icons.ios_share,
            color: AppColors.accent.color,
            onPressed: () {}),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: Text(
                textModifier1(
                  songInfo?.artist_names ?? 'NoName',
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Text(songInfo?.title ?? '',
                style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        LikeButton(
          color: AppColors.accent.color,
          onPressed: () {
            setState(() {
              _toggleFavorite();
              if (isFavorite) {
                favoriteProvider.addToFavorites(SongModel(
                  id: widget.param,
                  artist_names: songInfo?.artist_names ?? '',
                  title: songInfo?.title ?? '',
                  header_image_url: songInfo?.header_image_url ?? '',
                ));
              } else {
                favoriteProvider.removeFromFavorites(SongModel(
                  id: widget.param,
                  artist_names: songInfo?.artist_names ?? '',
                  title: songInfo?.title ?? '',
                  header_image_url: songInfo?.header_image_url ?? '',
                ));
              }
            });
          },
          isFavorite: isFavorite,
        ),
      ],
    );
  }

  Widget _buildImageSection(SongDetail? songInfo) {
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;

    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(maxWidth / 2),
        bottomRight: Radius.circular(maxWidth / 2),
      ),
      child: SizedBox(
        height: maxHeight / 2,
        width: maxWidth - maxWidth * 0.2,
        child: Image.network(
          songInfo?.header_image_url ??
              'https://static.dezeen.com/uploads/2020/06/architects-designers-racial-justice-george-floyd-protests-dezeen-sq-a.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
