import '../popular_recipe/popular_recipes.dart';

class Recipe {
  final int numberOfServings;
  final String totalTime;
  final String images;
  final String name;
  final double rating;
  final List<IngredientLines>? ingredients;
  final List<String>? recipe;

  Recipe({
    required this.numberOfServings,
    required this.totalTime,
    required this.images,
    required this.name,
    required this.rating,
    this.ingredients,
    this.recipe,
  });
}
