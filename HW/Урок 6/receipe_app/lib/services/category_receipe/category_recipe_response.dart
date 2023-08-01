import 'package:receipe_app/services/category_receipe/category_recipe_service.dart';

import '../../models/category_recipe/category_receipe.dart';

class CategoryRecipeRepository {
  final CategoryRecipeService categoryRecipeService =
      CategoryRecipeService.create();

  Future<List<CategoryData>> getCategoryRecipes() async {
    final apiReceipes = await categoryRecipeService.getApi();

    final apiRecipeResponse = apiReceipes.body as Map<String, dynamic>;
    final apiRecipeList = CategoryRecipeResponce.fromJson(apiRecipeResponse);
    final recipeList = apiRecipeList.browseCategories;

    return recipeList;
  }
}
