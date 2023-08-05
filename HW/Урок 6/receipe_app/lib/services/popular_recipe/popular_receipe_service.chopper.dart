// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_recipe_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$PopularRecipeService extends PopularRecipeService {
  _$PopularRecipeService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = PopularRecipeService;

  @override
  Future<Response<RecipeResponce>> getApi(
    int start,
    int limit,
    String tag,
  ) {
    final Uri $url = Uri.parse('https://yummly2.p.rapidapi.com/feeds/list');
    final Map<String, dynamic> $params = <String, dynamic>{
      'start': start,
      'limit': limit,
      'tag': tag,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<RecipeResponce, RecipeResponce>($request);
  }
}
