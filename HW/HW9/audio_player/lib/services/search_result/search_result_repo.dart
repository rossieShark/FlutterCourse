import 'package:audio_player/models/search_result/search_result_model.dart';

import 'search_result_service.dart';

class SearchResultRepository {
  final SearchResultService searchResultService = SearchResultService.create();

  Future<List<Hits>> getSearchResults(int perPage, int page, String q) async {
    final apiResult =
        await searchResultService.getSearchResult(perPage, page, q);

    final apiResultResponse = apiResult.body?.hits as List<Hits>;

    return apiResultResponse;
  }
}
