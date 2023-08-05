import '../services_export.dart';

import '../../models/models_export.dart';

class CategoryRecipeRepository {
  final CategoryRecipeService categoryRecipeService =
      CategoryRecipeService.create();

  Future<List<CategoryData>> getCategoryRecipes() async {
    final apiReceipes = await categoryRecipeService.getApi();

    final apiRecipeResponse =
        apiReceipes.body?.browseCategories as List<CategoryData>;
    // final apiRecipeList = CategoryRecipeResponce.fromJson(apiRecipeResponse);
    // final recipeList = apiRecipeList.browseCategories;

    return apiRecipeResponse;
  }
}
