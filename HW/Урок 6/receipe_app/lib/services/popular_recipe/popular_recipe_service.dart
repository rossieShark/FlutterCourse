import 'package:chopper/chopper.dart';
import '../../services/services.dart';

part 'popular_receipe_service.chopper.dart';

@ChopperApi(baseUrl: "https://yummly2.p.rapidapi.com")
abstract class PopularRecipeService extends ChopperService {
  static PopularRecipeService create() => _$PopularRecipeService(
        ChopperClient(
            interceptors: [HeaderInterceptor()],
            converter: $JsonSerializableConverter()),
      );
  @Get(path: 'feeds/list')
  Future<Response<Object>> getApi(
      @Query() int start, @Query() int limit, @Query() String tag);
}
