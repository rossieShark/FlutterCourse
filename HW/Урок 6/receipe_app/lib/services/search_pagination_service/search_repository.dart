import '../../services/services.dart';
import '../../models/index.dart';

class SearchRecipeRepository {
  final SearchRecipeService searchRecipeService = SearchRecipeService.create();

  Future<List<RecipeFeed>> getSearchResult(
      int start, int maxResult, String q) async {
    await Future.delayed(const Duration(seconds: 1));
    print('Data is fetching');
    final apiRecipes =
        await searchRecipeService.getSearchList(start, maxResult, q);

    final apiRecipeResponse = apiRecipes.body as Map<String, dynamic>;
    final apiRecipeList = RecipeResponce.fromJson(apiRecipeResponse);
    final searchList = apiRecipeList.feed;

    return searchList;
  }
}
