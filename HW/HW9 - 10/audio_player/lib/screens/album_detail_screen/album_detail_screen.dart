import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/screens/album_detail_screen/additional_widgets/index.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class AlbumDetailPage extends StatefulWidget {
  final String param;
  final String title;

  const AlbumDetailPage({super.key, required this.param, required this.title});

  @override
  State<AlbumDetailPage> createState() => _AlbumDetailPageState();
}

class _AlbumDetailPageState extends State<AlbumDetailPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolling = false;
  bool _canScrollUp = false;
  bool _canScrollDown = false;

  @override
  void initState() {
    super.initState();
    _fetchAlbumDetails();
    _scrollController.addListener(() {
      setState(() {
        _canScrollDown = _scrollController.position.pixels > 0;
        _canScrollUp = _scrollController.position.pixels <
            _scrollController.position.maxScrollExtent;
      });
    });
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
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<AlbumDetailBloc, AlbumDetailBlocState>(
        builder: (context, state) {
      if (state.albumDetailList.isEmpty) {
        return const Center(
          child: CustomFadingCircleIndicator(),
        );
      } else {
        final songList = state.albumDetailList;

        return MouseRegion(
          onEnter: (_) {
            setState(() {
              _isScrolling = true;
            });
          },
          onExit: (_) {
            setState(() {
              _isScrolling = false;
            });
          },
          child: Scaffold(
            backgroundColor: Colors.black,
            body: songList.isEmpty
                ? const NoDataWidget()
                : Stack(children: [
                    CreateBackgroundImage(
                      imageUrl: songList.isEmpty
                          ? 'https://static.dezeen.com/uploads/2020/06/architects-designers-racial-justice-george-floyd-protests-dezeen-sq-a.jpg'
                          : songList[0].songImage,
                      height: MediaQuery.of(context).size.height / 2,
                    ),
                    CreatePlayButtonSection(
                        param: widget.param,
                        title: widget.title,
                        songList: songList),
                    Positioned.fill(
                      top: MediaQuery.of(context).size.height / 2 - 50,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: DetailAlbumListView(
                            scrollController: _scrollController,
                            maxWidth: maxWidth,
                            songList: songList),
                      ),
                    ),
                    Positioned.fill(
                        top: MediaQuery.of(context).size.height / 2 - 100,
                        child: CreateScrollSection(_isScrolling, _canScrollUp,
                            _canScrollDown, _scrollController))
                  ]),
          ),
        );
      }
    });
  }
}
