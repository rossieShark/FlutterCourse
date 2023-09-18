import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/models/models.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class CreateResentlySearchedListView extends StatefulWidget {
  const CreateResentlySearchedListView({
    super.key,
    required this.width,
  });

  final double width;

  @override
  State<CreateResentlySearchedListView> createState() =>
      _CreateResentlySearchedListViewState();
}

class _CreateResentlySearchedListViewState
    extends State<CreateResentlySearchedListView> {
  final ScrollController _horizontalScroll = ScrollController();

  bool _canScrollBack = false;
  bool _canScrollForward = true;

  @override
  void initState() {
    super.initState();

    _horizontalScroll.addListener(() {
      setState(() {
        _canScrollBack = _horizontalScroll.position.pixels > 0;
        _canScrollForward = _horizontalScroll.position.pixels <
            _horizontalScroll.position.maxScrollExtent;
      });
    });
  }

  @override
  void dispose() {
    _horizontalScroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final recentlySearched = Provider.of<RecentlySearchedProvider>(context);
    const double listHeight = 70;
    return HoverableWidget(builder: (context, child, isHovered) {
      return Stack(
        children: [
          SizedBox(
            height: 200,
            child: ListView.builder(
                itemCount: recentlySearched.recentlySearchedList.length,
                scrollDirection: Axis.horizontal,
                controller: _horizontalScroll,
                itemBuilder: (context, index) {
                  final song = recentlySearched.recentlySearchedList[index];
                  return GestureDetector(
                    onTap: () {},
                    child: _CreateListViewContent(
                      listHeight: listHeight,
                      song: song,
                    ),
                  );
                }),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 20,
            child: CreateScrollButtons(
                isHovered: isHovered,
                canScrollForward: _canScrollForward,
                horizontalScroll: _horizontalScroll,
                canScrollBack: _canScrollBack),
          ),
        ],
      );
    });
  }
}

class _CreateListViewContent extends StatelessWidget {
  const _CreateListViewContent({
    required this.listHeight,
    required this.song,
  });

  final double listHeight;
  final SongModel song;

  @override
  Widget build(BuildContext context) {
    final recentlySearched = Provider.of<RecentlySearchedProvider>(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: HoverableWidget(builder: (context, child, isHovered) {
        return Stack(
          children: [
            _CreateSongInfoLayer(song: song),
            Positioned.fill(
                child: _CreateButtonsLayer(
              recentlySearched: recentlySearched,
              song: song,
              isHovered: isHovered,
            ))
          ],
        );
      }),
    );
  }
}

class _CreateSongInfoLayer extends StatelessWidget {
  const _CreateSongInfoLayer({
    required this.song,
  });

  final SongModel song;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.withOpacity(0.1)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 120,
                height: 120,
                child: Image.network(
                  song.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          CreateSongTitle(
            artistName: song.artistNames,
            songTitle: song.title,
          ),
        ],
      ),
    );
  }
}

class _CreateButtonsLayer extends StatelessWidget {
  const _CreateButtonsLayer({
    required this.recentlySearched,
    required this.song,
    required this.isHovered,
  });

  final RecentlySearchedProvider recentlySearched;
  final SongModel song;
  final bool isHovered;

  void playPauseMusic(BuildContext context, MusicProvider musicProvider) {
    Provider.of<RecentlyPlayedIdProvider>(context, listen: false)
        .setId(song.id);
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButtonWidget(
          onPressed: () {
            recentlySearched.removeFromFavorites(song);
          },
          iconData: Icons.cancel,
          size: 30,
          color: AppColors.white.color,
        ),
        isHovered
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: CreatePlayButton(
                  onPressed: () {
                    playPauseMusic(context, musicProvider);
                  },
                  size: 35,
                  icon: (musicProvider.isPlaying &&
                          musicProvider.isCurrentlyPlaying(int.parse(song.id)))
                      ? Icon(Icons.pause, color: AppColors.black.color)
                      : Icon(Icons.play_arrow, color: AppColors.black.color),
                  containerColor: AppColors.accent.color,
                ),
              )
            : Container()
      ],
    );
  }
}
