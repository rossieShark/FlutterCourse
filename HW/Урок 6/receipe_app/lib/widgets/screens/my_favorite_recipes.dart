import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receipe_app/widgets/widgets/widgets_export.dart';

class MyRecepiecesWidget extends StatelessWidget {
  const MyRecepiecesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double maxWidth = MediaQuery.of(context).size.width;

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
          favoriteProvider: favoriteProvider, maxWidth: maxWidth),
    );
  }
}

class FavoruteListView extends StatelessWidget {
  const FavoruteListView({
    super.key,
    required this.favoriteProvider,
    required this.maxWidth,
  });

  final FavoriteProvider favoriteProvider;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    bool isIpad = MediaQuery.of(context).size.width > 600;
    final double maxHeight = MediaQuery.of(context).size.height;
    return ListView.builder(
      itemCount: favoriteProvider.favoriteReceipe.length,
      itemBuilder: (context, index) {
        final imageWidth = isIpad ? maxWidth * 0.16 : maxWidth * 0.23;
        final containerHeight = maxHeight * 0.18;
        final recipe = favoriteProvider.favoriteReceipe[index];
        return Dismissible(
          key: Key(recipe.name), // Use a unique key for each item
          direction: DismissDirection.endToStart, // Swipe direction
          background: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                borderRadius: BorderRadius.circular(maxWidth * 0.025),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
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
                            5 * 16 -
                            8,
                        height: containerHeight,
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                child: Text(
                                  recipe.name,
                                  style: TextStyle(
                                      fontSize: maxWidth * 0.03,
                                      fontFamily: AppFonts.montserrat.font,
                                      color: AppColors.white.color),
                                  textAlign: TextAlign.left,
                                  maxLines: 2,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.av_timer,
                                      color: AppColors.white.color),
                                  SizedBox(
                                    width: isIpad
                                        ? maxWidth * 0.02
                                        : maxWidth * 0.03,
                                  ),
                                  Text(
                                    recipe.totalTime,
                                    style: TextStyle(
                                      fontFamily: AppFonts.montserrat.font,
                                      color: AppColors.white.color,
                                      fontSize: isIpad
                                          ? maxWidth * 0.02
                                          : maxWidth * 0.03,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: AppColors.yellow.color,
                                        size: isIpad
                                            ? maxWidth * 0.04
                                            : maxWidth * 0.05,
                                      ),
                                      Text(
                                        ' ${recipe.rating}',
                                        style: TextStyle(
                                          color: AppColors.white.color,
                                          fontFamily: AppFonts.montserrat.font,
                                          fontSize: isIpad
                                              ? maxWidth * 0.02
                                              : maxWidth * 0.03,
                                        ),
                                      )
                                    ],
                                  ),
                                  IconButtonWidget(
                                    onPressed: () {
                                      print('shareButton Pressed');
                                    },
                                    iconData: Icons.ios_share,
                                    size: isIpad
                                        ? maxWidth * 0.04
                                        : maxWidth * 0.05,
                                    color: AppColors.white.color,
                                  )
                                ],
                              )
                            ],
                          ),
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
