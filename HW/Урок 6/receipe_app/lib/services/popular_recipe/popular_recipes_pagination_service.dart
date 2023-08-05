import '../../models/models_export.dart';
import '../services_export.dart';

class RecipesPaginationService {
  bool _isLoading = false;
  // bool _hasMode = true;
  final PopularRecipeRepository _popularRepository = PopularRecipeRepository();
  late int _start;
  late int _limit;
  final String _tag = 'list.recipe.popular';
  final int _quantityOfSearchElements = 10;
  final int _startValue = 0;
  List<RecipeFeed> items = [];

  bool get isLoading => _isLoading;

  RecipesPaginationService() {
    _start = _startValue;
    _limit = _quantityOfSearchElements;
  }
  Future<void> loadMoreItems() async {
    if (_isLoading) return;
    _isLoading = true;
    await Future.delayed(const Duration(seconds: 2));
    final newPortion =
        await _popularRepository.getUpcomingRecipes(_start, _limit, _tag);

    items.addAll(newPortion);
    _isLoading = false;
    _start += _limit;
    _limit += _quantityOfSearchElements;
  }
}
