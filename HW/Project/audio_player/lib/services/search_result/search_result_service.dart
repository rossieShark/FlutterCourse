import 'package:audio_player/models/models.dart';
import 'package:audio_player/services/service.dart';

class SearchResultRepository {
  final AudioPlayerService searchResultService = AudioPlayerService.create();

  Future<List<SearchData>> getSearchResults(
    int index,
    int limit,
    String q,
  ) async {
    final apiResult =
        await searchResultService.getSearchResult(q, index, limit);

    final apiResultResponse = apiResult.body?.data as List<SearchData>;

    return apiResultResponse;
  }
}
