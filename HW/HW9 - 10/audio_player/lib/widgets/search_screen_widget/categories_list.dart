import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatefulWidget {
  final double width;
  const CategoriesList({super.key, required this.width});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  @override
  initState() {
    super.initState();
    BlocProvider.of<GenresBloc>(context).add(FetchGenresEvent());
  }

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = widget.width ~/ 230;
    return BlocBuilder<GenresBloc, GenresState>(
      builder: (context, state) {
        if (state.items.isEmpty) {
          return const Center(
            child: CustomFadingCircleIndicator(),
          );
        } else {
          final genres = state.items;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: widget.width,
              height: genres.length.toDouble() / crossAxisCount * 230 +
                  16 * (genres.length.toDouble() / crossAxisCount),
              child: GridView.count(
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: crossAxisCount,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                children: genres.asMap().entries.map((entry) {
                  final index = entry.key;
                  return GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                      child: HoverableWidget(
                        builder: (context, child, isHovered) {
                          return AnimatedScale(
                            scale: isHovered ? 1.1 : 1.0,
                            duration: const Duration(milliseconds: 200),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: SizedBox(
                                    height: 400,
                                    child: Image.network(
                                      genres[0].images[1].url ?? '',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: HoverableWidget(
                                    builder: (context, child, isHovered) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          color: isHovered
                                              ? Colors.black.withOpacity(0.1)
                                              : Colors.black.withOpacity(0.6),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Positioned.fill(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        genres[index].name ?? '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                        textAlign: TextAlign.center,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
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
