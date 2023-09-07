import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/database.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class FavoriteArtistList extends StatefulWidget {
  const FavoriteArtistList({
    super.key,
  });

  @override
  State<FavoriteArtistList> createState() => _FavoriteArtistListState();
}

class _FavoriteArtistListState extends State<FavoriteArtistList> {
  @override
  initState() {
    super.initState();
    BlocProvider.of<FavoriteArtistBloc>(context)
        .add(FetchFavoriteArtistsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteArtistBloc, FavoriteArtistState>(
        builder: (context, state) {
      if (state.favoriteArtistList.isEmpty) {
        return const Center(
          child: CustomFadingCircleIndicator(),
        );
      } else {
        final favoriteArtistList = state.favoriteArtistList;
        return CreateListView(favoriteArtistList: favoriteArtistList);
      }
    });
  }
}

class CreateListView extends StatefulWidget {
  const CreateListView({
    super.key,
    required this.favoriteArtistList,
  });

  final List<FavoriteArtist> favoriteArtistList;

  @override
  State<CreateListView> createState() => _CreateListViewState();
}

class _CreateListViewState extends State<CreateListView> {
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
    return HoverableWidget(builder: (context, child, isHovered) {
      return Stack(children: [
        ListView(
          controller: _horizontalScroll,
          scrollDirection: Axis.horizontal,
          children: List.generate(widget.favoriteArtistList.length, (index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ResponsiveBuilder(
                      narrow: 78.0,
                      medium: 110.0,
                      large: 120.0,
                      builder: (context, child, height) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(height / 2),
                          child: SizedBox(
                            height: height,
                            width: height,
                            child: child,
                          ),
                        );
                      },
                      child: Image.network(
                          widget.favoriteArtistList[index].image,
                          fit: BoxFit.cover),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ResponsiveBuilder(
                        narrow: 16.0,
                        medium: 18.0,
                        large: 18.0,
                        builder: (context, child, size) {
                          return Text(
                            TextModifierService().removeTextAfter(
                                widget.favoriteArtistList[index].name),
                            style: TextStyle(
                              fontFamily: AppFonts.colombia.font,
                              fontSize: size,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          );
                        }),
                    const SizedBox(
                      height: 5,
                    ),
                  ]),
            );
          }),
        ),
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 20,
            child: CreateScrollButtons(
              canScrollBack: _canScrollBack,
              horizontalScroll: _horizontalScroll,
              canScrollForward: _canScrollForward,
              isHovered: isHovered,
            )),
      ]);
    });
  }
}
