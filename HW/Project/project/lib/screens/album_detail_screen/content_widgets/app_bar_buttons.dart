import 'package:project/app_logic/blocs/bloc_exports.dart';
import 'package:project/databases/database.dart';
import 'package:project/models/models.dart';
import 'package:project/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreatePlayButtonSection extends StatelessWidget {
  final String param;
  final String image;
  final String title;
  final String artist;
  final List<DetailAlbum> songList;
  const CreatePlayButtonSection(
      {super.key,
      required this.param,
      required this.image,
      required this.title,
      required this.artist,
      required this.songList});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(children: [
          _CreateAppBarButtons(
            param: param,
            image: image,
            songList: songList,
            title: title,
            artist: artist,
          ),
          Container(
            color: Colors.transparent,
            height: MediaQuery.of(context).size.height / 2 - 150,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ResponsiveBuilder(
                  narrow: 50.0,
                  medium: 60.0,
                  large: 60.0,
                  builder: (context, child, height) {
                    return CreatePlayButton(
                      id: songList[0].id,
                      size: height,
                      iconColor: AppColors.black.color,
                      containerColor: AppColors.white.color,
                    );
                  }),
            ),
          ),
        ]),
      ),
    );
  }
}

class _CreateAppBarButtons extends StatelessWidget {
  final String param;
  final String image;
  final String title;
  final String artist;
  final List<DetailAlbum> songList;
  const _CreateAppBarButtons(
      {required this.param,
      required this.image,
      required this.songList,
      required this.title,
      required this.artist});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PlatformBuilder(
            iOS: ResponsiveButton(
                iconData: Icons.arrow_back_ios,
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                color: AppColors.white.color),
            other: ResponsiveButton(
                iconData: Icons.arrow_back,
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                color: AppColors.white.color),
            builder: (context, child, data) {
              return IconButtonWidget(
                  iconData: data.iconData,
                  color: data.color,
                  onPressed: data.onPressed);
            }),
        _LikeButtonWidget(param: param, songList: songList, image: image),
      ],
    );
  }
}

class _LikeButtonWidget extends StatefulWidget {
  final String param;
  final String image;
  final List<DetailAlbum> songList;
  const _LikeButtonWidget(
      {required this.param, required this.image, required this.songList});

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
    isFavorite = favoriteProvider.isFavoriteAlbum(widget.param);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final List<DetailAlbum> songs = widget.songList;
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        return LikeButton(
            onPressed: () {
              _toggleFavorite();
              final songInfoModel = SongModel(
                type: 'album',
                id: widget.param,
                artistNames: songs[0].title,
                title: songs[0].artistNames,
                image: widget.image,
              );

              favoriteBloc.add(ToggleFavoriteAlbumEvent(songInfoModel));
            },
            isFavorite: isFavorite);
      },
    );
  }
}
