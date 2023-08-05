// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receipe_app/models/models_export.dart';
import 'package:receipe_app/widgets/screens/full_recipes.dart';
import 'package:receipe_app/widgets/screens/home_screen.dart';
import 'package:receipe_app/widgets/widgets/widgets_export.dart';

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

  @override
  void initState() {
    super.initState();
    _numberOfServings = widget.numberOfServings;
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

  @override
  Widget build(BuildContext context) {
    final double maxWidth = MediaQuery.of(context).size.width;

    bool isIpad = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      backgroundColor: AppColors.black.color,
      body: Column(children: [
        Flexible(
          flex: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: HeaderStack(
              description: widget.description,
              totalTime: widget.totalTime,
              images: widget.images,
              name: widget.name,
              rating: widget.rating,
              numberOfServings: _numberOfServings,
            ),
          ),
        ),
        SizedBox(
          height: maxWidth * 0.03,
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
                  fontSize: isIpad ? maxWidth * 0.04 : maxWidth * 0.06,
                  fontFamily: AppFonts.fontspring.font,
                ),
              ),
              Container(
                height: isIpad ? maxWidth * 0.06 : maxWidth * 0.09,
                width: isIpad ? maxWidth * 0.18 : maxWidth * 0.25,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.white.color, width: 2),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _MyButton(
                      icon: Icons.remove,
                      onClick: _decrementCounter,
                      size: isIpad ? maxWidth * 0.05 : maxWidth * 0.06,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(45),
                      child: Container(
                        height: isIpad ? maxWidth * 0.04 : maxWidth * 0.06,
                        width: isIpad ? maxWidth * 0.04 : maxWidth * 0.06,
                        color: AppColors.yellow.color,
                        child: Center(
                          child: Text(
                            '$_numberOfServings',
                            style: TextStyle(
                                fontSize:
                                    isIpad ? maxWidth * 0.025 : maxWidth * 0.04,
                                fontFamily: AppFonts.montserrat.font,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    _MyButton(
                      icon: Icons.add,
                      onClick: _incrementCounter,
                      size: isIpad ? maxWidth * 0.05 : maxWidth * 0.06,
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
            height: isIpad ? maxWidth * 0.3 : maxWidth * 0.4,
            child: IngredientsListView(
              widget: widget,
              isIpad: isIpad,
              numberOfServings: _numberOfServings,
              maxWidth: maxWidth,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          height: isIpad ? maxWidth * 0.07 : maxWidth * 0.1,
          width: isIpad ? maxWidth * 0.3 : maxWidth * 0.4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
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
                fontSize: isIpad ? maxWidth * 0.02 : maxWidth * 0.03,
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
    required this.maxWidth,
    required this.isIpad,
    required int numberOfServings,
  }) : _numberOfServings = numberOfServings;

  final double maxWidth;
  final bool isIpad;
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
            width: isIpad ? maxWidth * 0.18 : maxWidth * 0.25,
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
                    height: isIpad ? maxWidth * 0.12 : maxWidth * 0.16,
                    width: isIpad ? maxWidth * 0.12 : maxWidth * 0.16,
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
                      height: isIpad ? maxWidth * 0.1 : maxWidth * 0.1,
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
                                fontSize: isIpad
                                    ? maxWidth * 0.017
                                    : maxWidth * 0.022,
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
                                fontSize: isIpad
                                    ? maxWidth * 0.015
                                    : maxWidth * 0.022,
                                fontFamily: AppFonts.montserrat.font,
                                color: AppColors.white.color)),
                      ),
                      Text(widget.ingredients?[index].unit ?? '-',
                          style: TextStyle(
                              fontSize:
                                  isIpad ? maxWidth * 0.015 : maxWidth * 0.022,
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

class HeaderStack extends StatefulWidget {
  final int numberOfServings;
  final String totalTime;
  final String images;
  final String name;
  final double rating;
  final String? description;

  const HeaderStack(
      {Key? key,
      required this.numberOfServings,
      required this.totalTime,
      required this.images,
      required this.name,
      required this.rating,
      required this.description})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HeaderStackState createState() => _HeaderStackState();
}

class _HeaderStackState extends State<HeaderStack> {
  bool isFavorite = false;

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
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
    final double maxWidth = MediaQuery.of(context).size.width;
    final favoriteProvider =
        Provider.of<FavoriteProvider>(context, listen: false);
    bool isIpad = MediaQuery.of(context).size.width > 600;
    return Stack(children: [
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
                width: maxWidth - 32,
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
                          fontSize: isIpad ? maxWidth * 0.05 : maxWidth * 0.06,
                        ),
                        maxLines: 2,
                      ),
                      SizedBox(height: maxWidth * 0.01),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StarRating(
                                starCount: 5,
                                rating: widget.rating,
                                color: AppColors.yellow.color,
                                size:
                                    isIpad ? maxWidth * 0.04 : maxWidth * 0.05),
                            Row(
                              children: [
                                Icon(
                                  Icons.av_timer,
                                  color: AppColors.white.color,
                                  size: isIpad
                                      ? maxWidth * 0.04
                                      : maxWidth * 0.05,
                                ),
                                Text(
                                  ' ${widget.totalTime}',
                                  style: TextStyle(
                                      color: AppColors.white.color,
                                      fontFamily: AppFonts.montserrat.font,
                                      fontSize: isIpad
                                          ? maxWidth * 0.03
                                          : maxWidth * 0.04),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.room_service_outlined,
                                  color: AppColors.white.color,
                                  size: isIpad
                                      ? maxWidth * 0.04
                                      : maxWidth * 0.05,
                                ),
                                Text(
                                  '${widget.numberOfServings}',
                                  style: TextStyle(
                                      fontFamily: AppFonts.montserrat.font,
                                      color: AppColors.white.color,
                                      fontSize: isIpad
                                          ? maxWidth * 0.03
                                          : maxWidth * 0.04),
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
                            fontSize:
                                isIpad ? maxWidth * 0.025 : maxWidth * 0.03),
                      ),
                      SizedBox(height: maxWidth * 0.03)
                    ]),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
