import 'package:receipe_app/services/search_pagination_service/search_repository.dart';

import '../../models/popular_recipe/popular_recipes.dart';

class SearchPaginationService {
  bool _isLoading = false;

  final SearchRecipeRepository _searchRepository = SearchRecipeRepository();
  int _start = 0;
  int _maxResult = 10;
  String _q = ' ';

  List<RecipeFeed> items = [];
  bool get isLoading => _isLoading;

  Future<void> loadMoreItems(String q) async {
    if (q.isEmpty) {
      items.clear();
      return;
    }
    if (_q != q) {
      _start = 0;
      _maxResult = 10;
      items.clear();
    }
    _q = q;
    _isLoading = true;

    final newPortion =
        await _searchRepository.getSearchResult(_start, _maxResult, q);
    items.addAll(newPortion);
    _isLoading = false;
    _start += _maxResult;
    _maxResult += 10;
  }
}
