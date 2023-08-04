import '../../services/services.dart';
import '../../models/index.dart';

class SearchPaginationService {
  bool _isLoading = false;

  final SearchRecipeRepository _searchRepository = SearchRecipeRepository();
  int quantityOfSearchElements = 10;
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
      _maxResult = quantityOfSearchElements;
      items.clear();
    }
    _q = q;
    _isLoading = true;

    final newPortion =
        await _searchRepository.getSearchResult(_start, _maxResult, q);
    items.addAll(newPortion);
    _isLoading = false;
    _start += _maxResult;
    _maxResult += quantityOfSearchElements;
  }
}
