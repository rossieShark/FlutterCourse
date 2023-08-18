// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genres_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$GenresService extends GenresService {
  _$GenresService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = GenresService;

  @override
  Future<Response<GenresResponce>> getGenres() {
    final Uri $url = Uri.parse(
        'https://spotify23.p.rapidapi.com/genre_view/?id=0JQ5DAqbMKFEC4WFtoNRpw&content_limit=10&limit=20');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<GenresResponce, GenresResponce>($request);
  }
}
