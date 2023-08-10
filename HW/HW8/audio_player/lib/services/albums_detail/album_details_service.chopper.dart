// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_details_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$AlbumDetailsService extends AlbumDetailsService {
  _$AlbumDetailsService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = AlbumDetailsService;

  @override
  Future<Response<AlbumDetailsResponce>> getAlbumSongsList(String id) {
    final Uri $url = Uri.parse(
        'https://genius-song-lyrics1.p.rapidapi.com/album/appearances/');
    final Map<String, dynamic> $params = <String, dynamic>{'id': id};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<AlbumDetailsResponce, AlbumDetailsResponce>($request);
  }
}
