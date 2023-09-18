import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/models/models.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class FavouriteListContent extends StatelessWidget {
  const FavouriteListContent({
    super.key,
    required this.song,
  });

  final SongModel song;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        narrow: 70.0,
        medium: 90.0,
        large: 90.0,
        builder: (context, child, height) {
          return SizedBox(
            height: height,
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CreateImageSection(song: song, height: height),
                      ResponsiveBuilder(
                          narrow: 100.0,
                          medium: 170.0,
                          large: 300.0,
                          builder: (context, child, size) {
                            return SizedBox(
                              width: size,
                              child: CreateSongTitle(
                                artistName: song.artistNames,
                                songTitle: song.title,
                                maxLines: 2,
                              ),
                            );
                          }),
                    ],
                  ),
                  IconButtonWidget(
                      iconData: Icons.keyboard_control,
                      color: AppColors.white.color,
                      onPressed: () {}),
                ]),
          );
        });
  }
}

class CreateImageSection extends StatelessWidget {
  const CreateImageSection(
      {super.key, required this.song, required this.height});

  final SongModel song;
  final double height;
  void playPauseMusic(BuildContext context, MusicProvider musicProvider) {
    Provider.of<RecentlyPlayedIdProvider>(context, listen: false)
        .setId(song.id.toString());
    if (musicProvider.isSongPlaying(int.parse(song.id))) {
      if (musicProvider.isPlaying) {
        musicProvider.pause();
      } else {
        musicProvider.play(musicProvider.playlist[0].preview);
      }
    } else {
      musicProvider.clearPlaylist();

      musicProvider
          .addSong(PlayedSong(id: int.parse(song.id), preview: song.preview));
      musicProvider.play(musicProvider.playlist[0].preview);
      musicProvider.currentSongId = int.parse(song.id);
    }
    musicProvider.musicCompleted();
  }

  @override
  Widget build(BuildContext context) {
    final musicProvider = Provider.of<MusicProvider>(context, listen: false);
    return HoverableWidget(builder: (context, child, isHovered) {
      return Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
            child: ClipRRect(
              borderRadius: song.type == 'album'
                  ? BorderRadius.circular(height) / 2
                  : BorderRadius.circular(8),
              child: SizedBox(
                width: height,
                height: height,
                child: Image.network(song.image, fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              right: 16,
              child: (isHovered && song.type == 'track')
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                          color: AppColors.black.color.withOpacity(0.5),
                          child: CreatePlayButton(
                              onPressed: () {
                                playPauseMusic(context, musicProvider);
                              },
                              icon: (musicProvider.isPlaying &&
                                      musicProvider.isCurrentlyPlaying(
                                          int.parse(song.id)))
                                  ? Icon(Icons.pause,
                                      color: AppColors.white.color)
                                  : Icon(Icons.play_arrow,
                                      color: AppColors.white.color),
                              size: 30,
                              containerColor: Colors.transparent)),
                    )
                  : Container())
        ],
      );
    });
  }
}
