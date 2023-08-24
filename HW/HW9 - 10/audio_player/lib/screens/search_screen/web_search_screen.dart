import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

import 'additional_widgets/exports.dart';

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
                  title: Padding(
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
                  ),
                ),
                _isTappedTextField
                    ? SliverToBoxAdapter(
                        child: SearchResultlist(
                          width: MediaQuery.of(context).size.width / 2 - 30,
                        ),
                      )
                    : _CreateGenresSection(),
              ],
            ),
          ),
          VerticalDivider(
            width: 2,
            color: AppColors.white.color,
          ),
          _CreateRecentlySearchedSection(),
        ],
      ),
    );
  }
}

class _CreateGenresSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Text(
              'Genres',
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
}

class _CreateRecentlySearchedSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RecentlySearchedProvider>(context);
    return Expanded(
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recently Searched',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextButton(
                        onPressed: () {
                          provider.removeAll();
                        },
                        child: Text('Clear all',
                            style: Theme.of(context).textTheme.bodySmall)),
                  ],
                ),
              ),
              Divider(
                color: AppColors.accent.color,
                height: 1,
                thickness: 1,
              ),
              const SizedBox(height: 10),
              Expanded(
                child: RecentlySearchedList(
                    width: MediaQuery.of(context).size.width / 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
