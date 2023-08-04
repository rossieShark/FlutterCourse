import '../../services/services.dart';

import '../../models/index.dart';

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
