// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_recipe_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$CategoryRecipeService extends CategoryRecipeService {
  _$CategoryRecipeService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = CategoryRecipeService;

  @override
  Future<Response<CategoryRecipeResponce>> getApi() {
    final Uri $url =
        Uri.parse('https://yummly2.p.rapidapi.com/categories/list/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<CategoryRecipeResponce, CategoryRecipeResponce>($request);
  }
}
