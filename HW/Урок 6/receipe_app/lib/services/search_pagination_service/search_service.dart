import 'package:chopper/chopper.dart';
import '../../models/models_export.dart';
import '../services_export.dart';

part 'search_service.chopper.dart';

@ChopperApi(baseUrl: "https://yummly2.p.rapidapi.com")
abstract class SearchRecipeService extends ChopperService {
  static SearchRecipeService create() => _$SearchRecipeService(
        ChopperClient(
            interceptors: [HeaderInterceptor()],
            converter: $JsonSerializableConverter()),
      );

  @Get(path: 'feeds/search')
  Future<Response<RecipeResponce>> getSearchList(
      @Query() int start, @Query() int maxResult, @Query() String q);
}
