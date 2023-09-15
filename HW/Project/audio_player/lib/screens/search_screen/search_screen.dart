import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/screens/search_screen/search_export.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final ScrollController _scrollController = ScrollController();
  SearchResultBloc get searchBloc => BlocProvider.of<SearchResultBloc>(context);
  late final TextEditingController _textFieldController =
      TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });

    _textFieldController.addListener(() {
      searchBloc
          .add(SearchEvent.textChanged(newText: _textFieldController.text));
    });

    _scrollController.addListener(() {
      if (_scrollController.offset >=
          _scrollController.position.maxScrollExtent - 200) {
        searchBloc
            .add(SearchEvent.loadMoreItems(text: _textFieldController.text));
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textFieldController.dispose();
    _focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchResultBloc, SearchState>(
        builder: (context, state) {
      return Scaffold(
        backgroundColor: AppColors.background.color,
        body: Row(
          children: [
            Expanded(
              child: CustomScrollView(controller: _scrollController, slivers: [
                SliverAppBar(
                  pinned: true,
                  backgroundColor: AppColors.background.color,
                  title: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _SearchTextField(
                      controller: _textFieldController,
                      focusNode: _focusNode,
                      onPressed: () {
                        setState(() {
                          _textFieldController.clear();
                        });
                      },
                    ),
                  ),
                ),
                PlatformBuilder(
                    web: state.map(
                        empty: (_) => const CreateBlocEmptyState(),
                        loading: (_) => const SliverToBoxAdapter(
                            child: CustomFadingCircleIndicator()),
                        noResults: (_) => const NoResultsWidget(),
                        loaded: (loadEvent) => CreateSearchSection(
                              scrollController: _scrollController,
                              searchResult: loadEvent.data,
                              textFieldController: _textFieldController,
                            )),
                    other: state.map(
                        empty: (_) => const SliverToBoxAdapter(
                              child: MobileRecentlySearchedSection(),
                            ),
                        loading: (_) => const SliverToBoxAdapter(
                            child: CustomFadingCircleIndicator()),
                        noResults: (_) => const NoResultsWidget(),
                        loaded: (loadEvent) => SliverToBoxAdapter(
                              child:
                                  SearchListView(searchResult: loadEvent.data),
                            )),
                    builder: (context, child, widget) {
                      return widget;
                    })
              ]),
            ),
          ],
        ),
      );
    });
  }
}

class _SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  final VoidCallback onPressed;

  const _SearchTextField({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: AppColors.accent.color,
      focusNode: focusNode,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 6.0),
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        hintText: focusNode.hasFocus
            ? ''
            : AppLocalizations.of(context)!.searchTextFieldHintText,
        hintStyle: TextStyle(
            fontFamily: AppFonts.colombia.font,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white),
        labelStyle: TextStyle(color: AppColors.white.color),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: focusNode.hasFocus
                ? AppColors.white.color
                : AppColors.accent.color,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: AppColors.white.color)),
        suffixIcon: controller.text.isNotEmpty
            ? IconButtonWidget(
                iconData: Icons.clear,
                color: AppColors.accent.color,
                onPressed: onPressed,
              )
            : null,
      ),
      style: TextStyle(
          fontFamily: AppFonts.colombia.font,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white),
    );
  }
}
