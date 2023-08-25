import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/database.dart';
import 'package:audio_player/models/models.dart';
import 'package:audio_player/screens/tab_bar/go_router.dart';
import 'package:audio_player/widgets/responsive_widgets/platform_widget/platform_widget.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreatePlayButtonSection extends StatelessWidget {
  final String param;
  final String title;
  final List<DetailAlbum> songList;
  const CreatePlayButtonSection(
      {super.key,
      required this.param,
      required this.title,
      required this.songList});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(children: [
          _CreateAppBarButtons(param: param, title: title, songList: songList),
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
          ),
        ]),
      ),
    );
  }
}

class _CreateAppBarButtons extends StatelessWidget {
  final String param;
  final String title;
  final List<DetailAlbum> songList;
  const _CreateAppBarButtons(
      {required this.param, required this.title, required this.songList});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PlatformBuilder(
            web: ResponsiveButton(
                iconData: Icons.search,
                onPressed: () {
                  context.go(routeNameMap[RouteName.search]!);
                },
                color: AppColors.white.color),
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
        LikeButtonWidget(param: param, title: title, songList: songList)
      ],
    );
  }
}

class LikeButtonWidget extends StatefulWidget {
  final String param;
  final String title;
  final List<DetailAlbum> songList;
  const LikeButtonWidget(
      {super.key,
      required this.param,
      required this.title,
      required this.songList});

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
    isFavorite = favoriteProvider.containsAlbum(widget.param);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final List<DetailAlbum> songs = widget.songList;
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        return LikeButton(
          color: AppColors.accent.color,
          onPressed: () {
            _toggleFavorite();
            final songInfoModel = SongModel(
              id: widget.param,
              artist_names: widget.title,
              title: songs[0].artistNames,
              header_image_url: songs[0].headerImageUrl,
            );

            if (isFavorite) {
              favoriteBloc.add(AddToFavoritesAlbumsEvent(songInfoModel));
            } else {
              favoriteBloc.add(RemoveFromFavoritesAlbumsEvent(songInfoModel));
            }
          },
          isFavorite: isFavorite,
        );
      },
    );
  }
}
