import 'package:audio_player/models/detail_album/detail_album_model.dart';

import 'package:audio_player/services/services.dart';
import 'package:audio_player/widgets/ui_properties.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AlbumDetailPage extends StatelessWidget {
  final String param;

  AlbumDetailPage({
    super.key,
    required this.param,
  });

  final AlbumDetailsRepository _albumSongs = AlbumDetailsRepository();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _albumSongs.getAlbumSongsList(param),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildLoadingIndicator(context);
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final songList = snapshot.data;
            double pageSize = MediaQuery.of(context).size.height / 2 -
                100 +
                songList!.length.toInt() * 66;
            return _buildMainStructure(songList, pageSize, context);
          }
        });
  }

  Widget _buildMainStructure(
      List<AlbumAppearances> songList, double pageSize, BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    bool isIpad = maxWidth > 600;
    double sizeInspector(double size) {
      return isIpad ? size * 1 : size * 1.3;
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: songList.isEmpty
          ? const NoDataWidget()
          : Stack(children: [
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButtonWidget(
                            iconData: Icons.arrow_back,
                            color: AppColors.white.color,
                            onPressed: () {
                              GoRouter.of(context).push('/');
                            }),
                        IconButtonWidget(
                            iconData: Icons.favorite,
                            color: AppColors.white.color,
                            onPressed: () {})
                      ],
                    ),
                    Container(
                      color: Colors.transparent,
                      height: MediaQuery.of(context).size.height / 2 - 150,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: sizeInspector(maxWidth * 0.09),
                          width: sizeInspector(maxWidth * 0.09),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: IconButtonWidget(
                            onPressed: () {},
                            iconData: Icons.play_arrow,
                            size: sizeInspector(maxWidth * 0.05),
                            color: AppColors.black.color,
                          ),
                        ),
                      ),
                    ),
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
            ]),
    );
  }

  Container _buildLoadingIndicator(BuildContext context) {
    return Container(
        color: AppColors.black.color,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: const CustomFadingCircleIndicator());
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
                  GoRouter.of(context).push('/');
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
    bool isIpad = maxWidth > 600;
    double sizeInspector(double size) {
      return isIpad ? size * 1 : size * 1.3;
    }

    return ListView(
        scrollDirection: Axis.vertical,
        children: List.generate(songList.length, (index) {
          final id = songList[index].song.id;
          return GestureDetector(
            onTap: () {
              context.go('/detail_music/$id');
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: sizeInspector(maxWidth * 0.07),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '${index + 1}',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: AppFonts.colombia.font,
                                fontSize: sizeInspector(maxWidth * 0.03),
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                songList[index].song.title ?? '',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: AppFonts.lusitana.font,
                                    fontSize: sizeInspector(maxWidth * 0.02),
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                songList[index].song.artist_names ?? '',
                                style: TextStyle(
                                    fontFamily: AppFonts.colombia.font,
                                    fontSize: sizeInspector(maxWidth * 0.027),
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              )
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
