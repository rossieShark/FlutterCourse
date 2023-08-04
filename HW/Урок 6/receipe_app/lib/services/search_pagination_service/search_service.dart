import 'package:chopper/chopper.dart';
import '../../services/services.dart';

part 'search_service.chopper.dart';

@ChopperApi(baseUrl: "https://yummly2.p.rapidapi.com")
abstract class SearchRecipeService extends ChopperService {
  static SearchRecipeService create() => _$SearchRecipeService(
        ChopperClient(
            interceptors: [HeaderInterceptor()],
            converter: $JsonSerializableConverter()),
      );

  @Get(path: 'feeds/search')
  Future<Response<Object>> getSearchList(
      @Query() int start, @Query() int maxResult, @Query() String q);
}
