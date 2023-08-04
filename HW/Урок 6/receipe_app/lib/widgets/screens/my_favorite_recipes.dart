import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receipe_app/widgets/widgets/button_widget.dart';

import '../providers/favorite_provider.dart';
import '../widgets/ui_widget.dart';

class MyRecepiecesWidget extends StatelessWidget {
  const MyRecepiecesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double maxHeight = MediaQuery.of(context).size.height;
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.black.color,
      appBar: AppBar(
        backgroundColor: AppColors.black.color,
        title: Text(
          'Favorites',
          style:
              TextStyle(color: AppColors.white.color, fontFamily: 'Fontspring'),
        ),
      ),
      body: FavoruteListView(
          favoriteProvider: favoriteProvider, maxHeight: maxHeight),
    );
  }
}

class FavoruteListView extends StatelessWidget {
  const FavoruteListView({
    super.key,
    required this.favoriteProvider,
    required this.maxHeight,
  });

  final FavoriteProvider favoriteProvider;
  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favoriteProvider.favoriteReceipe.length,
      itemBuilder: (context, index) {
        final imageWidth = maxHeight * 0.14;
        final containerHeight = maxHeight * 0.17;
        final recipe = favoriteProvider.favoriteReceipe[index];
        return Dismissible(
          key: Key(recipe.name), // Use a unique key for each item
          direction: DismissDirection.endToStart, // Swipe direction
          background: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: Colors.red, // Background color when swiping
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          onDismissed: (direction) {
            favoriteProvider.removeFromFavorites(recipe);
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Container(
              height: containerHeight,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 67, 66, 66).withOpacity(0.3),
                borderRadius: BorderRadius.circular(maxHeight * 0.025),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(imageWidth / 2),
                        child: Image.network(
                          recipe.images,
                          height: imageWidth,
                          width: imageWidth,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width -
                            imageWidth -
                            6 * 16,
                        height: containerHeight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              recipe.name,
                              style: TextStyle(
                                  fontSize: maxHeight * 0.017,
                                  fontFamily: AppFonts.montserrat.font,
                                  color: AppColors.white.color),
                              textAlign: TextAlign.left,
                              maxLines: 2,
                            ),
                            Row(
                              children: [
                                Icon(Icons.av_timer,
                                    color: AppColors.white.color),
                                SizedBox(width: maxHeight * 0.007),
                                Text(
                                  recipe.totalTime,
                                  style: TextStyle(
                                      fontFamily: AppFonts.montserrat.font,
                                      color: AppColors.white.color,
                                      fontSize: maxHeight * 0.015),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: AppColors.yellow.color,
                                      size: maxHeight * 0.023,
                                    ),
                                    Text(
                                      ' ${recipe.rating}',
                                      style: TextStyle(
                                          color: AppColors.white.color,
                                          fontFamily: AppFonts.montserrat.font,
                                          fontSize: maxHeight * 0.015),
                                    )
                                  ],
                                ),
                                IconButtonWidget(
                                  onPressed: () {
                                    print('shareButton Pressed');
                                  },
                                  iconData: Icons.ios_share,
                                  size: maxHeight * 0.023,
                                  color: AppColors.white.color,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        );
      },
    );
  }
}
