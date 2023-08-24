import 'package:audio_player/models/search_result/search_result_model.dart';
import 'package:audio_player/services/services.dart';
import 'package:chopper/chopper.dart';

part 'search_result_service.chopper.dart';

@ChopperApi(baseUrl: "https://genius-song-lyrics1.p.rapidapi.com")
abstract class SearchResultService extends ChopperService {
  static SearchResultService create() => _$SearchResultService(
        ChopperClient(
            interceptors: [HeaderInterceptor()],
            converter: $JsonSerializableConverter()),
      );

  @Get(path: '/search/')
  Future<Response<SearchResultResponce>> getSearchResult(
      @Query('per_page') int perPage, @Query() int page, @Query() String q);
}
