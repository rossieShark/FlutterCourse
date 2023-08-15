import 'dart:async';
import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/models/models.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final ScrollController _scrollController = ScrollController();
  late final TextEditingController _textFieldController =
      TextEditingController();
  bool _isTappedTextField = false;
  final FocusNode _focusNode = FocusNode();
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
    _textFieldController.addListener(_onTextFieldChanged);
    _scrollController.addListener(_scrollListener);
  }

  void _onTextFieldChanged() {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(seconds: 1), _loadMoreItems);
  }

  void _loadMoreItems() {
    final albumBloc = BlocProvider.of<SearchResultBloc>(context);
    albumBloc.add(FetchSearchResultEvent(_textFieldController.text));
  }

  void _scrollListener() {
    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent - 200) {
      _loadMoreItems();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textFieldController.dispose();
    _focusNode.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background.color,
      body: CustomScrollView(controller: _scrollController, slivers: [
        SliverAppBar(
          pinned: true,
          backgroundColor: AppColors.background.color,
          title: _buildTextField(context),
        ),
        _isTappedTextField
            ? const SliverToBoxAdapter(
                child: SearchResultlist(),
              )
            : _buildRecentlySearchedSection(context),
      ]),
    );
  }

  Widget _buildRecentlySearchedSection(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Recenly Searched',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Center(
              child: Container(
                height: 10,
                width: MediaQuery.of(context).size.width - 32,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: AppColors.accent.color, width: 1))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const RecentlySearchedList()
          ]),
    );
  }

  Widget _buildTextField(BuildContext context) {
    return TextField(
      controller: _textFieldController,
      cursorColor: AppColors.accent.color,
      focusNode: _focusNode,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 6.0),
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        hintText: _focusNode.hasFocus ? '' : 'Song, Artist name',
        hintStyle: Theme.of(context).textTheme.bodySmall,
        labelStyle: TextStyle(color: AppColors.white.color),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: _focusNode.hasFocus
                ? AppColors.white.color
                : AppColors.accent.color,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: AppColors.white.color)),
        suffixIcon: _textFieldController.text.isNotEmpty
            ? IconButtonWidget(
                iconData: Icons.clear,
                color: AppColors.accent.color,
                onPressed: () {
                  setState(() {
                    _textFieldController.clear();
                    _isTappedTextField = false;
                  });
                },
              )
            : null,
      ),
      style: Theme.of(context).textTheme.bodySmall,
      onChanged: (query) {
        setState(() {
          _isTappedTextField = true;
        });
      },
    );
  }
}

class RecentlySearchedList extends StatelessWidget {
  const RecentlySearchedList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final recentlySearched = Provider.of<RecentlySearchedProvider>(context);
    return recentlySearched.favoriteSong.isEmpty
        ? SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Text(
              'Search history is empty',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ))
        : SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.separated(
              itemCount: recentlySearched.favoriteSong.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                final song = recentlySearched.favoriteSong[index];

                return GestureDetector(
                  onTap: () {
                    String id = song.id;
                    context.go(Uri(path: '/detail_music/$id').toString());
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    child: SizedBox(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: SizedBox(
                                width: 70,
                                height: 70,
                                child: Image.network(
                                  song.header_image_url,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width -
                                    60 -
                                    16 * 3 -
                                    32 -
                                    48,
                                child: Text(
                                  textModifier2(song.artist_names),
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                textModifier2(song.title),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                          IconButtonWidget(
                            iconData: Icons.keyboard_control,
                            color: AppColors.white.color,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ));
  }
}

class SearchResultlist extends StatelessWidget {
  const SearchResultlist({super.key});

  @override
  Widget build(BuildContext context) {
    final recentlySearched =
        Provider.of<RecentlySearchedProvider>(context, listen: false);
    return BlocBuilder<SearchResultBloc, SearchResultState>(
        builder: (context, state) {
      print('SearchResultBloc State: $state');
      if (state.searchResulList.isEmpty) {
        return const Center(
          child: CustomFadingCircleIndicator(),
        );
      } else {
        final searchResult = state.searchResulList;
        return searchResult.isEmpty
            ? SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: Text(
                  'No results',
                  style: TextStyle(color: AppColors.white.color, fontSize: 25),
                )))
            : SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 86 * searchResult.length.toDouble(),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(searchResult.length, (index) {
                      return GestureDetector(
                          onTap: () {
                            int id = searchResult[index].result.id;

                            context
                                .go(Uri(path: '/detail_music/$id').toString());

                            recentlySearched.addToFavorites(SongModel(
                              id: id.toString(),
                              artist_names:
                                  searchResult[index].result.artist_names ?? '',
                              title: searchResult[index].result.title ?? '',
                              header_image_url:
                                  searchResult[index].result.header_image_url ??
                                      '',
                            ));
                          },
                          child: SizedBox(
                              height: 70,
                              width: MediaQuery.of(context).size.width - 32,
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 16, 0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: SizedBox(
                                        width: 60,
                                        height: 60,
                                        child: Image.network(
                                            searchResult[index]
                                                    .result
                                                    .header_image_url ??
                                                'https://static.dezeen.com/uploads/2020/06/architects-designers-racial-justice-george-floyd-protests-dezeen-sq-a.jpg',
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                60 -
                                                16 * 4 -
                                                48,
                                        child: Text(
                                          searchResult[index].result.title ??
                                              '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                          textModifier1(searchResult[index]
                                              .result
                                              .artist_names!),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(16, 0, 0, 0),
                                    child: IconButtonWidget(
                                        iconData: Icons.keyboard_control,
                                        color: AppColors.white.color,
                                        onPressed: () {}),
                                  )
                                ],
                              )));
                    }),
                  ),
                ),
              );
      }
    });
  }
}
