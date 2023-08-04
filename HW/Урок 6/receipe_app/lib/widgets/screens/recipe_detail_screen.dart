// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/index.dart';

import '../providers/favorite_provider.dart';
import '../widgets/button_widget.dart';
import '../widgets/rating_widget.dart';
import '../widgets/ui_widget.dart';
import 'full_recipes.dart';
import 'home_screen.dart';

class ReceipeDetailScreen extends StatefulWidget {
  final int numberOfServings;
  final String totalTime;
  final String images;
  final String name;
  final double rating;
  final List<IngredientLines>? ingredients;
  final List<String>? reciepe;
  final String? description;

  const ReceipeDetailScreen(
      {Key? key,
      required this.numberOfServings,
      required this.totalTime,
      required this.images,
      required this.name,
      required this.rating,
      required this.ingredients,
      required this.reciepe,
      required this.description})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ReceipeDetailScreenState createState() => _ReceipeDetailScreenState();
}

class _ReceipeDetailScreenState extends State<ReceipeDetailScreen> {
  late int _numberOfServings;
  final int _minServings = 1;
  final int _maxServings = 10;
  List<Recipe> favoriteReceipe = [];

  bool isFavorite = false;
  @override
  void initState() {
    super.initState();
    _numberOfServings = widget.numberOfServings;
  }

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  void _incrementCounter() {
    setState(() {
      if (_numberOfServings < _maxServings) {
        _numberOfServings++;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_numberOfServings > _minServings) {
        _numberOfServings--;
      }
    });
  }

  String textModifier() {
    String originalText = widget.description ?? "";

    if (originalText.contains('The recipe is a Yummly original')) {
      int lastIndex =
          originalText.lastIndexOf('The recipe is a Yummly original');
      String modifiedText = originalText.substring(0, lastIndex);
      return modifiedText;
    } else {
      return " ";
    }
  }

  @override
  Widget build(BuildContext context) {
    final double maxHeight = MediaQuery.of(context).size.height;
    final favoriteProvider =
        Provider.of<FavoriteProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: AppColors.black.color,
      body: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Stack(children: [
            Image.network(widget.images,
                fit: BoxFit.cover,
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2),
            Positioned.fill(
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SafeArea(
                    child: Container(
                      height: 20,
                      width: MediaQuery.of(context).size.width - 32,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButtonWidget(
                            iconData: Icons.close,
                            color: AppColors.white.color,
                            onPressed: () {
                              Navigator.pop(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeController(),
                                  fullscreenDialog: true,
                                ),
                              );
                            },
                          ),
                          IconButtonWidget(
                            iconData: isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            onPressed: () {
                              setState(() {
                                _toggleFavorite();
                                if (isFavorite) {
                                  favoriteProvider.addToFavorites(Recipe(
                                    numberOfServings: widget.numberOfServings,
                                    totalTime: widget.totalTime,
                                    images: widget.images,
                                    name: widget.name,
                                    rating: widget.rating,
                                  ));
                                } else {
                                  favoriteProvider.removeFromFavorites(Recipe(
                                    numberOfServings: widget.numberOfServings,
                                    totalTime: widget.totalTime,
                                    images: widget.images,
                                    name: widget.name,
                                    rating: widget.rating,
                                  ));
                                }
                              });
                            },
                            color: isFavorite
                                ? AppColors.white.color
                                : AppColors.white.color,
                          )
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.name,
                              style: TextStyle(
                                fontFamily: AppFonts.fontspring.font,
                                color: AppColors.white.color,
                                fontWeight: FontWeight.w600,
                                fontSize: maxHeight * 0.032,
                              ),
                              maxLines: 2,
                            ),
                            SizedBox(height: maxHeight * 0.01),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  StarRating(
                                      starCount: 5,
                                      rating: widget.rating,
                                      color: AppColors.yellow.color,
                                      size: maxHeight * 0.027),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.av_timer,
                                        color: AppColors.white.color,
                                        size: maxHeight * 0.025,
                                      ),
                                      Text(
                                        ' ${widget.totalTime}',
                                        style: TextStyle(
                                            color: AppColors.white.color,
                                            fontFamily:
                                                AppFonts.montserrat.font,
                                            fontSize: maxHeight * 0.021),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.room_service_outlined,
                                        color: AppColors.white.color,
                                        size: maxHeight * 0.025,
                                      ),
                                      Text(
                                        '$_numberOfServings',
                                        style: TextStyle(
                                            fontFamily:
                                                AppFonts.montserrat.font,
                                            color: AppColors.white.color,
                                            fontSize: maxHeight * 0.021),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              textModifier(),
                              maxLines: 8,
                              style: TextStyle(
                                  color: AppColors.white.color,
                                  fontFamily: AppFonts.montserrat.font,
                                  fontSize: maxHeight * 0.017),
                            ),
                            SizedBox(height: maxHeight * 0.01)
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
        SizedBox(
          height: maxHeight * 0.01,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Ingredients",
                style: TextStyle(
                  color: AppColors.white.color,
                  fontSize: maxHeight * 0.027,
                  fontFamily: AppFonts.fontspring.font,
                ),
              ),
              Container(
                height: maxHeight * 0.04,
                width: maxHeight * 0.11,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.white.color, width: 2),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _MyButton(
                      icon: Icons.remove,
                      onClick: _decrementCounter,
                      size: maxHeight * 0.03,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(45),
                      child: Container(
                        height: maxHeight * 0.027,
                        width: maxHeight * 0.027,
                        color: AppColors.yellow.color,
                        child: Center(
                          child: Text(
                            '$_numberOfServings',
                            style: TextStyle(
                                fontSize: maxHeight * 0.015,
                                fontFamily: AppFonts.montserrat.font,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    _MyButton(
                      icon: Icons.add,
                      onClick: _incrementCounter,
                      size: maxHeight * 0.03,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: maxHeight * 0.18,
            child: IngredientsListView(
              widget: widget,
              numberOfServings: _numberOfServings,
              maxHeight: maxHeight,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          height: maxHeight * 0.05,
          width: maxHeight * 0.16,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(maxHeight * 0.02),
              border:
                  Border.all(color: const Color.fromARGB(255, 247, 172, 33))),
          child: TextButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return FullRecipe(
                    recipe: widget.reciepe,
                  );
                },
              );
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
            ),
            child: Text(
              'See a receipe',
              style: TextStyle(
                fontSize: maxHeight * 0.014,
                fontFamily: AppFonts.montserrat.font,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class IngredientsListView extends StatelessWidget {
  const IngredientsListView({
    super.key,
    required this.widget,
    required this.maxHeight,
    required int numberOfServings,
  }) : _numberOfServings = numberOfServings;

  final double maxHeight;

  final int _numberOfServings;
  final ReceipeDetailScreen widget;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(widget.ingredients?.length ?? 0, (index) {
        double quantityForOnePerson =
            (widget.ingredients?[index].quantity ?? 0) /
                widget.numberOfServings;

        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
          child: Container(
            width: maxHeight * 0.13,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.black.color.withOpacity(1),
                border: Border.all(color: AppColors.white.color)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: maxHeight * 0.07,
                    width: maxHeight * 0.07,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        color: AppColors.white.color),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(AppImages.broccoli.image),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 4, 4, 4),
                  child: Center(
                    child: Container(
                      height: maxHeight * 0.05,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors.yellow.color,
                            width:
                                1.0, // Specify the width of the border, adjust as needed
                          ),
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.ingredients?[index].ingredient ?? '',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: maxHeight * 0.011,
                                fontFamily: AppFonts.montserrat.font,
                                fontWeight: FontWeight.w400,
                                color: AppColors.white.color),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                            quantityForOnePerson == 0
                                ? '-'
                                : '${(quantityForOnePerson * _numberOfServings).toStringAsFixed(2)} ',
                            style: TextStyle(
                                fontSize: maxHeight * 0.011,
                                fontFamily: AppFonts.montserrat.font,
                                color: AppColors.white.color)),
                      ),
                      Text(widget.ingredients?[index].unit ?? '-',
                          style: TextStyle(
                              fontSize: maxHeight * 0.01,
                              fontFamily: AppFonts.montserrat.font,
                              color: AppColors.white.color))
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}

class _MyButton extends StatelessWidget {
  const _MyButton({
    required this.icon,
    required this.onClick,
    required this.size,
  });

  final IconData icon;
  final void Function() onClick;
  final double size;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      mouseCursor: SystemMouseCursors.click,
      onTap: onClick,
      borderRadius: BorderRadius.circular(1000),
      child: SizedBox(
        height: size,
        width: size,
        child: Icon(
          icon,
          color: AppColors.white.color,
        ),
      ),
    );
  }
}
