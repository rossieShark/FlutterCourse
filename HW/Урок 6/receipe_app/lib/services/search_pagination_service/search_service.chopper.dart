// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$SearchRecipeService extends SearchRecipeService {
  _$SearchRecipeService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = SearchRecipeService;

  @override
  Future<Response<Object>> getSearchList(
    int start,
    int maxResult,
    String q,
  ) {
    final Uri $url = Uri.parse('https://yummly2.p.rapidapi.com/feeds/search');
    final Map<String, dynamic> $params = <String, dynamic>{
      'start': start,
      'maxResult': maxResult,
      'q': q,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<Object, Object>($request);
  }
}
