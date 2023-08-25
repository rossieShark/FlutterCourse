import '../services_export.dart';
import '../../models/models_export.dart';

class SearchPaginationService {
  bool _isLoading = false;

  final SearchRecipeRepository _searchRepository = SearchRecipeRepository();
  final int _quantityOfSearchElements = 10;
  final int _startValue = 0;
  late int _start;
  late int _maxResult;
  String _q = ' ';

  List<RecipeFeed> items = [];
  bool get isLoading => _isLoading;

  SearchPaginationService() {
    _start = _startValue;
    _maxResult = _quantityOfSearchElements;
  }

  Future<void> loadMoreItems(String q) async {
    if (q.isEmpty) {
      items.clear();
      return;
    }
    if (_q != q) {
      _start = _startValue;
      _maxResult = _quantityOfSearchElements;
      items.clear();
    }
    _q = q;
    _isLoading = true;

    final newPortion =
        await _searchRepository.getSearchResult(_start, _maxResult, q);
    items.addAll(newPortion);
    _isLoading = false;
    _start += _maxResult;
    _maxResult += _quantityOfSearchElements;
  }
}
