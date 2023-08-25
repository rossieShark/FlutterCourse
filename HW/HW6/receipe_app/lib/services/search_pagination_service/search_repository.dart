import '../services_export.dart';
import '../../models/models_export.dart';

class SearchRecipeRepository {
  final SearchRecipeService searchRecipeService = SearchRecipeService.create();

  Future<List<RecipeFeed>> getSearchResult(
      int start, int maxResult, String q) async {
    await Future.delayed(const Duration(seconds: 1));
    print('Data is fetching');
    final apiRecipes =
        await searchRecipeService.getSearchList(start, maxResult, q);

    final apiRecipeResponseFeed = apiRecipes.body?.feed as List<RecipeFeed>;
    //final apiRecipeList = RecipeResponce.fromJson(apiRecipeResponse);
    // final searchList = RecipeResponce.fromJson(apiRecipeResponse).feed;
    return apiRecipeResponseFeed;
    // return searchList;
  }
}
