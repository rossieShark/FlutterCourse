import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/screens/search_screen/additional_widgets/exports.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class SearchMobileScreen extends StatefulWidget {
  final TextEditingController textFieldController;
  final FocusNode focusNode;
  final ScrollController scrollController;

  const SearchMobileScreen(
      {super.key,
      required this.textFieldController,
      required this.focusNode,
      required this.scrollController});

  @override
  State<SearchMobileScreen> createState() => _SearchMobileScreenState();
}

class _SearchMobileScreenState extends State<SearchMobileScreen> {
  bool _isTappedTextField = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background.color,
      body: Builder(builder: (context) {
        return CustomScrollView(controller: widget.scrollController, slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: AppColors.background.color,
            title: SearchTextField(
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
          ),
          _isTappedTextField
              ? SliverToBoxAdapter(
                  child: SearchResultlist(
                      width: MediaQuery.of(context).size.width),
                )
              : SliverToBoxAdapter(
                  child: _CreateRecentlySearchedSection(),
                ),
        ]);
      }),
    );
  }
}

class _CreateRecentlySearchedSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RecentlySearchedProvider>(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  bottom: BorderSide(color: AppColors.accent.color, width: 1))),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      RecentlySearchedList(width: MediaQuery.of(context).size.width),
      Center(
        child: TextButton(
            onPressed: () {
              provider.removeAll();
            },
            child: Text('Clear all',
                style: Theme.of(context).textTheme.bodyLarge)),
      )
    ]);
  }
}
