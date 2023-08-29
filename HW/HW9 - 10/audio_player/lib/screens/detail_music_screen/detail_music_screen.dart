import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/database.dart';
import 'package:audio_player/screens/detail_music_screen/additional_widgets/index.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailMusicPage extends StatefulWidget {
  final String param;
  const DetailMusicPage({super.key, required this.param});

  @override
  State<DetailMusicPage> createState() => _DetailMusicPageState();
}

class _DetailMusicPageState extends State<DetailMusicPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DetailMusicPageBloc>(context).add(
      FetchSongDetailEvent(widget.param),
    );
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
        final songInfo = state.songDetail;

        return Scaffold(
          backgroundColor: AppColors.background.color,
          body: SingleChildScrollView(
            child: GestureDetector(
                onVerticalDragUpdate: (details) {
                  if (details.delta.dy > 10) {
                    GoRouter.of(context).pop();
                  }
                },
                child:
                    _CreatMainContent(param: widget.param, songInfo: songInfo)),
          ),
        );
      }
    });
  }
}

class _CreatMainContent extends StatelessWidget {
  final DetailInfoSong? songInfo;
  final String param;
  const _CreatMainContent({required this.songInfo, required this.param});

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(maxWidth / 2),
            bottomRight: Radius.circular(maxWidth / 2),
          ),
          child: SizedBox(
            height: maxHeight / 2,
            width: maxWidth - maxWidth * 0.2,
            child: Image.network(
              songInfo?.imageUrl ??
                  'https://static.dezeen.com/uploads/2020/06/architects-designers-racial-justice-george-floyd-protests-dezeen-sq-a.jpg',
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        SizedBox(
          height: maxHeight / 2 - 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CreatTitleSection(param: param, songInfo: songInfo),
              const CreatSliderSection(),
              const CreatMusicControlSection(),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
