import 'package:chopper/chopper.dart';
import 'package:receipe_app/models/models_export.dart';
import '../services_export.dart';

part 'popular_receipe_service.chopper.dart';

@ChopperApi(baseUrl: "https://yummly2.p.rapidapi.com")
abstract class PopularRecipeService extends ChopperService {
  static PopularRecipeService create() => _$PopularRecipeService(
        ChopperClient(
            interceptors: [HeaderInterceptor()],
            converter: $JsonSerializableConverter()),
      );
  @Get(path: 'feeds/list')
  Future<Response<RecipeResponce>> getApi(
      @Query() int start, @Query() int limit, @Query() String tag);
}
