import '../../models/models_export.dart';
import '../services_export.dart';

class PopularRecipeRepository {
  final PopularRecipeService popularRecipeService =
      PopularRecipeService.create();

  Future<List<RecipeFeed>> getUpcomingRecipes(
      int start, int limit, String tag) async {
    final apiRecipes = await popularRecipeService.getApi(start, limit, tag);

    final apiRecipeResponse = apiRecipes.body?.feed as List<RecipeFeed>;
    //final apiRecipeList = RecipeResponce.fromJson(apiRecipeResponse);
    //final recipeList = apiRecipeList.feed;

    return apiRecipeResponse;
  }
}
