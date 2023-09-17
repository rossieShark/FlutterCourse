import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/models/models.dart';
import 'package:audio_player/widgets/custom_buttons/custom_like_button.dart';

import 'package:flutter/material.dart';

class LikeButtonWidget extends StatefulWidget {
  final String id;
  final String artistNames;
  final String title;
  final String image;
  final String preview;

  const LikeButtonWidget(
      {Key? key,
      required this.id,
      required this.artistNames,
      required this.title,
      required this.image,
      required this.preview})
      : super(key: key);

  @override
  State<LikeButtonWidget> createState() => _LikeButtonWidgetState();
}

class _LikeButtonWidgetState extends State<LikeButtonWidget> {
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
  void didChangeDependencies() {
    final favoriteProvider =
        Provider.of<FavoriteProvider>(context, listen: false);

    isFavorite = favoriteProvider.isFavoriteSong(widget.id);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {

        return LikeButton(
            onPressed: () {
              _toggleFavorite();
              final songInfoModel = SongModel(
                preview: widget.preview,
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
