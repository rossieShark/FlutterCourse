import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/models/models.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class CreateSearchSection extends StatefulWidget {
  final TextEditingController textFieldController;
  final List<SearchData> searchResult;
  final ScrollController scrollController;

  const CreateSearchSection(
      {super.key,
      required this.textFieldController,
      required this.searchResult,
      required this.scrollController});

  @override
  State<CreateSearchSection> createState() => _CreateSearchSectionState();
}

class _CreateSearchSectionState extends State<CreateSearchSection> {
  String filter = '';
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ResponsiveWidget(
        narrow: (context) => Column(children: [
          SizedBox(
            height: 60,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Search Result',
                  style: TextStyle(
                      fontFamily: AppFonts.lusitana.font,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          SearchListView(
            searchResult: widget.searchResult,
          ),
        ]),
        other: (context) => Column(
          children: [
            PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      for (int index = 0; index < searchFilters.length; index++)
                        GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.grey.withOpacity(0.1)),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 25,
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            if (searchFilters[index] == 'All') {
                                              filter = '';
                                            } else {
                                              filter = searchFilters[index];
                                            }
                                          });
                                          final albumBloc =
                                              BlocProvider.of<SearchResultBloc>(
                                                  context);
                                          albumBloc.add(SearchEvent.textChanged(
                                              newText:
                                                  // ignore: unnecessary_brace_in_string_interps
                                                  '${filter}:"${widget.textFieldController.text}"'));
                                        },
                                        child: Text(
                                          searchFilters[index],
                                          style: TextStyle(
                                            color: AppColors.accent.color,
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                            ))
                    ],
                  ),
                ),
              ),
            ),
            SearchListView(
              searchResult: widget.searchResult,
            ),
          ],
        ),
      ),
    );
  }
}

List<String> searchFilters = ['All', 'track', 'album'];
