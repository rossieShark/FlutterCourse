import 'dart:async';
import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/widgets/responsive_widgets/platform_widget/platform_widget.dart';
import 'package:audio_player/widgets/search_screen_widget/exports.dart';
import 'package:audio_player/widgets/widget_exports.dart';
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
        other: OtherScreen(
            textFieldController: _textFieldController,
            focusNode: _focusNode,
            scrollController: _scrollController),
        builder: (context, child, widget) {
          return widget;
        });
  }
}

class WebScreen extends StatefulWidget {
  final TextEditingController textFieldController;
  final FocusNode focusNode;
  final ScrollController scrollController;
  const WebScreen(
      {Key? key,
      required this.textFieldController,
      required this.focusNode,
      required this.scrollController})
      : super(key: key);

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  bool _isTappedTextField = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background.color,
      body: Row(
        children: [
          Expanded(
            child: CustomScrollView(
              controller: widget.scrollController,
              slivers: [
                SliverAppBar(
                  pinned: true,
                  backgroundColor: AppColors.background.color,
                  title: _buildTextField(context),
                ),
                _isTappedTextField
                    ? SliverToBoxAdapter(
                        child: SearchResultlist(
                          width: MediaQuery.of(context).size.width / 2 - 30,
                        ),
                      )
                    : _buildGenresSection(context),
              ],
            ),
          ),
          VerticalDivider(
            width: 2,
            color: AppColors.white.color,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: _buildRecentlySearchedSection(context)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGenresSection(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Text(
              'Others',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
        CategoriesList(
          width: MediaQuery.of(context).size.width / 2 - 30,
        ),
      ]),
    );
  }

  Widget _buildTextField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SearchTextField(
        controller: widget.textFieldController,
        focusNode: widget.focusNode,
        isTappedTextField: _isTappedTextField,
        onPressed: () {
          setState(() {
            widget.textFieldController.clear();
            _isTappedTextField = false;
          });
        },
        onChanged: (query) {
          setState(() {
            _isTappedTextField = true;
          });
        },
      ),
    );
  }
}

Widget _buildRecentlySearchedSection(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          'Recently Searched',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      Divider(
        color: AppColors.accent.color,
        height: 1,
        thickness: 1,
      ),
      const SizedBox(height: 10),
      Expanded(
        child:
            RecentlySearchedList(width: MediaQuery.of(context).size.width / 2),
      ),
    ],
  );
}

class OtherScreen extends StatefulWidget {
  final TextEditingController textFieldController;
  final FocusNode focusNode;
  final ScrollController scrollController;

  const OtherScreen(
      {super.key,
      required this.textFieldController,
      required this.focusNode,
      required this.scrollController});

  @override
  State<OtherScreen> createState() => _OtherScreenState();
}

class _OtherScreenState extends State<OtherScreen> {
  late final TextEditingController _textFieldController;
  late final ScrollController _scrollController;
  late final FocusNode _focusNode;
  bool _isTappedTextField = false;

  @override
  void initState() {
    _textFieldController = widget.textFieldController;
    _scrollController = widget.scrollController;
    _focusNode = widget.focusNode;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background.color,
      body: Builder(builder: (context) {
        return CustomScrollView(controller: _scrollController, slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: AppColors.background.color,
            title: _buildTextField(context),
          ),
          _isTappedTextField
              ? SliverToBoxAdapter(
                  child: SearchResultlist(
                      width: MediaQuery.of(context).size.width),
                )
              : _buildRecentlySearchedSection(context),
        ]);
      }),
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
            RecentlySearchedList(width: MediaQuery.of(context).size.width)
          ]),
    );
  }

  Widget _buildTextField(BuildContext context) {
    return SearchTextField(
      controller: _textFieldController,
      focusNode: _focusNode,
      isTappedTextField: _isTappedTextField,
      onPressed: () {
        setState(() {
          widget.textFieldController.clear();
          _isTappedTextField = false;
        });
      },
      onChanged: (query) {
        setState(() {
          _isTappedTextField = true;
        });
      },
    );
  }
}
