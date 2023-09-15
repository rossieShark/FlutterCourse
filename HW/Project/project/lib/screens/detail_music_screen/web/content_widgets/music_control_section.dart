import 'package:project/app_logic/blocs/bloc_exports.dart';
import 'package:project/databases/database.dart';
import 'package:project/models/models.dart';

import 'package:project/screens/detail_music_screen/detail_music_index.dart';

import 'package:project/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class MusicControlSection extends StatelessWidget {
  const MusicControlSection({
    super.key,
    required this.songInfo,
  });
  final DetailInfoSong songInfo;

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        CreatMusicControlSection(
          songInfo: songInfo,
        ),
        CreateSliderSection(
          width: maxWidth * 0.5,
        ),
      ],
    );
  }
}

class CreateLikeandShuffleSection extends StatelessWidget {
  const CreateLikeandShuffleSection({
    super.key,
    required this.param,
    required this.songInfo,
  });

  final String? param;
  final DetailInfoSong? songInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
      child: Row(
        children: [
          _LikeButtonWidget(
              id: param ?? '',
              artistNames: songInfo?.artistNames ?? '',
              title: songInfo?.title ?? '',
              image: songInfo?.imageUrl ?? ''),
          IconButtonWidget(
              iconData: Icons.ios_share,
              size: 20,
              color: AppColors.white.color,
              onPressed: () {}),
        ],
      ),
    );
  }
}

class _LikeButtonWidget extends StatefulWidget {
  final String id;
  final String artistNames;
  final String title;
  final String image;

  const _LikeButtonWidget({
    Key? key,
    required this.id,
    required this.artistNames,
    required this.title,
    required this.image,
  }) : super(key: key);

  @override
  State<_LikeButtonWidget> createState() => _LikeButtonWidgetState();
}

class _LikeButtonWidgetState extends State<_LikeButtonWidget> {
  late FavoriteBloc favoriteBloc;
  bool isFavorite = false;
  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  void initState() {
    super.initState();

    favoriteBloc = FavoriteBloc(
      Provider.of<FavoriteProvider>(context, listen: false),
    );
  }

  @override
  void didUpdateWidget(covariant _LikeButtonWidget oldWidget) {
    if (widget.id != oldWidget.id) {
      final favoriteProvider =
          Provider.of<FavoriteProvider>(context, listen: false);

      isFavorite = favoriteProvider.isFavoriteSong(widget.id);
    }
    super.didUpdateWidget(widget);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        // if (state is FavoriteSongUpdatedState) {
        //   isFavorite = state.isFavorite;
        // }

        return LikeButton(
            onPressed: () {
              _toggleFavorite();
              final songInfoModel = SongModel(
                type: "track",
                id: widget.id,
                artistNames: widget.artistNames,
                title: widget.title,
                image: widget.image,
              );

              favoriteBloc.add(ToggleFavoriteSongEvent(songInfoModel));
            },
            isFavorite: isFavorite);
      },
    );
  }
}
