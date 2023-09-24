import 'package:audio_player/models/search_result/search_result_model.dart';

import 'package:audio_player/services/search_result/search_result_service.dart';

class SearchResultPaginationService {
  final SearchResultRepository _searchResultRepository;
  SearchResultPaginationService(this._searchResultRepository);

  bool _isLoading = false;

  final int _perPage = 10;
  int _index = 0;
  int _limit = 10;
  String _q = '';

  List<SearchData> items = [];
  bool get isLoading => _isLoading;

  Future<void> loadMoreItems(String q) async {
    if (q.isEmpty) {
      items.clear();
      return;
    }
    if (_q != q) {
      _index = 0;
      _limit = _perPage;
      items.clear();
    }
    _q = q;
    _isLoading = true;

    final newPortion =
        await _searchResultRepository.getSearchResults(_index, _limit, _q);

    items.addAll(newPortion);

    _isLoading = false;
    _index += _perPage;

    _limit += _perPage;
  }
}
