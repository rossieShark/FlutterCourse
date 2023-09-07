import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/screens/album_detail_screen/detail_album_index.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class AlbumDetailPage extends StatefulWidget {
  final String param;
  final String image;
  final String title;
  final String artist;

  const AlbumDetailPage(
      {super.key,
      required this.param,
      required this.image,
      required this.title,
      required this.artist});

  @override
  State<AlbumDetailPage> createState() => _AlbumDetailPageState();
}

class _AlbumDetailPageState extends State<AlbumDetailPage> {
  @override
  void initState() {
    super.initState();
    _fetchAlbumDetails();
  }

  @override
  void didUpdateWidget(covariant AlbumDetailPage oldWidget) {
    if (widget.param != oldWidget.param) {
      _fetchAlbumDetails();
    }
    super.didUpdateWidget(oldWidget);
  }

  void _fetchAlbumDetails() {
    BlocProvider.of<AlbumDetailBloc>(context).add(
      FetchAlbumDetailBlocEvent(widget.param),
    );
  }

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<AlbumDetailBloc, AlbumDetailBlocState>(
        builder: (context, state) {
      if (state.albumDetailList.isEmpty) {
        return const Center(
          child: CustomFadingCircleIndicator(),
        );
      } else {
        final songList = state.albumDetailList;

        return Scaffold(
          backgroundColor: Colors.black,
          body: songList.isEmpty
              ? const NoDataWidget()
              : Stack(children: [
                  CreateBackgroundImage(
                    imageUrl: songList.isEmpty ? defaultImage : widget.image,
                    height: maxHeight / 2,
                  ),
                  CreatePlayButtonSection(
                      param: widget.param,
                      title: widget.title,
                      artist: widget.artist,
                      image: widget.image,
                      songList: songList),
                  Positioned.fill(
                    top: maxHeight / 2 - 50,
                    child: SizedBox(
                      width: maxWidth,
                      child: DetailAlbumListView(
                          image: widget.image, songList: songList),
                    ),
                  ),
                ]),
        );
      }
    });
  }
}
