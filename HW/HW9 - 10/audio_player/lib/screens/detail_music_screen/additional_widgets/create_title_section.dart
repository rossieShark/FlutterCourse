import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/models/models.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class CreatTitleSection extends StatelessWidget {
  final SongDetail? songInfo;
  final String param;
  const CreatTitleSection(
      {super.key, required this.songInfo, required this.param});

  @override
  Widget build(BuildContext context) {
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
                TextModifierService().removeTextAfter(
                  songInfo?.artistNames ?? 'NoName',
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Text(songInfo?.title ?? '',
                style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        _LikeButtonWidget(param: param, songInfo: songInfo)
      ],
    );
  }
}

class _LikeButtonWidget extends StatefulWidget {
  final String param;

  final SongDetail? songInfo;

  const _LikeButtonWidget({required this.param, required this.songInfo});

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
  void didChangeDependencies() {
    final favoriteProvider =
        Provider.of<FavoriteProvider>(context, listen: false);
    isFavorite = favoriteProvider.contains(widget.param);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        return LikeButton(
          color: AppColors.accent.color,
          onPressed: () {
            _toggleFavorite();
            final songInfoModel = SongModel(
              id: widget.param,
              artist_names: widget.songInfo?.artistNames ?? '',
              title: widget.songInfo?.title ?? '',
              header_image_url: widget.songInfo?.imageUrl ?? '',
            );

            if (isFavorite) {
              favoriteBloc.add(AddToFavoritesSongsEvent(songInfoModel));
            } else {
              favoriteBloc.add(RemoveFromFavoritesSongsEvent(songInfoModel));
            }
          },
          isFavorite: isFavorite,
        );
      },
    );
  }
}
