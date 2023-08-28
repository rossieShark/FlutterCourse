import 'package:audio_player/models/search_result/search_result_model.dart';

import 'package:audio_player/services/search_result/search_result_service.dart';

class SearchResultPaginationService {
  bool _isLoading = false;

  final SearchResultRepository _searchResultRepository =
      SearchResultRepository();

  final int _perPage = 10;
  int _page = 1;
  String _q = '';

  List<Hits> items = [];
  bool get isLoading => _isLoading;

  Future<void> loadMoreItems(String q) async {
    if (q.isEmpty) {
      items.clear();
      return;
    }
    if (_q != q) {
      _page = 1;
      items.clear();
    }
    _q = q;
    _isLoading = true;

    final newPortion =
        await _searchResultRepository.getSearchResults(_perPage, _page, _q);

    items.addAll(newPortion);
    _isLoading = false;
    _page += 1;
  }
}
