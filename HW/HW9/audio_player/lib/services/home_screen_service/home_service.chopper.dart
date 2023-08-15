// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$RecentlyPlayedService extends RecentlyPlayedService {
  _$RecentlyPlayedService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = RecentlyPlayedService;

  @override
  Future<Response<TracksResponce>> getApi() {
    final Uri $url =
        Uri.parse('https://genius-song-lyrics1.p.rapidapi.com/chart/songs/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<TracksResponce, TracksResponce>($request);
  }

  @override
  Future<Response<TracksResponce>> getFavorite() {
    final Uri $url = Uri.parse(
        'https://genius-song-lyrics1.p.rapidapi.com/chart/artists/?time_period=week&per_page=15&page=2');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<TracksResponce, TracksResponce>($request);
  }

  @override
  Future<Response<TracksResponce>> getBestAlbums(
    int per_page,
    int page,
  ) {
    final Uri $url =
        Uri.parse('https://genius-song-lyrics1.p.rapidapi.com/chart/albums/');
    final Map<String, dynamic> $params = <String, dynamic>{
      'per_page': per_page,
      'page': page,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<TracksResponce, TracksResponce>($request);
  }
}
