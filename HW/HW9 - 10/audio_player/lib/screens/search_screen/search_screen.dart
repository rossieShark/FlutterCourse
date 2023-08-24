import 'dart:async';
import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/app_logic/blocs/search_screen_bloc/serch_event.dart';
import 'package:audio_player/screens/search_screen/mobile_search_screen.dart';
import 'package:audio_player/screens/search_screen/web_search_screen.dart';
import 'package:audio_player/widgets/responsive_widgets/platform_widget/platform_widget.dart';

import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final ScrollController _scrollController = ScrollController();
  late final TextEditingController _textFieldController =
      TextEditingController();
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
    return PlatformBuilder(
        web: WebScreen(
          textFieldController: _textFieldController,
          scrollController: _scrollController,
          focusNode: _focusNode,
        ),
        other: SearchMobileScreen(
            textFieldController: _textFieldController,
            focusNode: _focusNode,
            scrollController: _scrollController),
        builder: (context, child, widget) {
          return widget;
        });
  }
}
