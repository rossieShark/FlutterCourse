import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/database.dart';
import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class CreateGenresSection extends StatelessWidget {
  const CreateGenresSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Text(
            AppLocalizations.of(context)!.browseAll,
            style: TextStyle(
                fontFamily: AppFonts.lusitana.font,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
        ),
        const Center(
          child: _GenresList(),
        ),
      ],
    );
  }
}

class _GenresList extends StatefulWidget {
  const _GenresList();

  @override
  State<_GenresList> createState() => _GenresListState();
}

class _GenresListState extends State<_GenresList> {
  @override
  initState() {
    super.initState();
    BlocProvider.of<GenresBloc>(context).add(FetchGenresEvent());
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final crossAxisCount = width ~/ 260;
    return BlocBuilder<GenresBloc, GenresState>(
      builder: (context, state) {
        if (state.genres.isEmpty) {
          return const Center(
            child: CustomFadingCircleIndicator(),
          );
        } else {
          final genres = state.genres;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 300,
              child: GridView.count(
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: crossAxisCount,
                scrollDirection: Axis.vertical,
                children: genres.asMap().entries.map((entry) {
                  final index = entry.key;
                  return GestureDetector(
                    onTap: () {},
                    child:
                        _CreateGenresListContent(genres: genres, index: index),
                  );
                }).toList(),
              ),
            ),
          );
        }
      },
    );
  }
}

class _CreateGenresListContent extends StatelessWidget {
  const _CreateGenresListContent({
    required this.genres,
    required this.index,
  });

  final List<MusicGenre> genres;
  final int index;

  @override
  Widget build(BuildContext context) {
    return HoverableWidget(builder: (context, child, isHovered) {
      return HoverableWidget(builder: (context, child, isHovered) {
        return AnimatedScale(
          scale: isHovered ? 1.1 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: 300,
                child: Image.network(
                  genres[0].image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: isHovered
                      ? AppColors.accent.color.withOpacity(0.3)
                      : AppColors.accent.color.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    genres[index].name,
                    style: TextStyle(
                        fontFamily: AppFonts.colombia.font,
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ]),
        );
      });
    });
  }
}
