import 'package:project/screens/search_screen/bloc_empty_state/web/recently_searched_section/recently_searched_list_view.dart';
import 'package:project/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class CreateRecentlySearchedSection extends StatelessWidget {
  const CreateRecentlySearchedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 270,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Search History',
                style: TextStyle(
                    fontFamily: AppFonts.lusitana.font,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            CreateResentlySearchedListView(
                width: MediaQuery.of(context).size.width),
          ],
        ));
  }
}
