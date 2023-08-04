import '../../models/index.dart';
import '../../services/services.dart';

class RecipesPaginationService {
  bool _isLoading = false;
  // bool _hasMode = true;
  final PopularRecipeRepository _popularRepository = PopularRecipeRepository();
  int _start = 0;
  int _limit = 5;
  final String _tag = 'list.recipe.popular';

  List<RecipeFeed> items = [];

  bool get isLoading => _isLoading;
  //bool get hasmode => _hasMode;

  Future<void> loadMoreItems() async {
    if (_isLoading) return;
    _isLoading = true;
    await Future.delayed(const Duration(seconds: 2));
    final newPortion =
        await _popularRepository.getUpcomingRecipes(_start, _limit, _tag);
    //_hasMode = newPortion.length == 10;
    items.addAll(newPortion);
    _isLoading = false;
    _start += _limit;
    _limit += 10;
  }
}
