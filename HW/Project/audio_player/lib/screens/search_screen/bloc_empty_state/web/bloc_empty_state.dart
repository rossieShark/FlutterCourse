import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/screens/search_screen/bloc_empty_state/web/genres_section/create_genres_section.dart';
import 'package:audio_player/screens/search_screen/bloc_empty_state/web/recently_searched_section/create_recently_searched_section.dart';
import 'package:flutter/material.dart';

class CreateBlocEmptyState extends StatelessWidget {
  const CreateBlocEmptyState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RecentlySearchedProvider>(context);
    return SliverToBoxAdapter(
      child: provider.recentlySearchedList.isEmpty
          ? const CreateGenresSection()
          : const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CreateRecentlySearchedSection(),
                CreateGenresSection()
              ],
            ),
    );
  }
}
