// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$SongDetailsService extends SongDetailsService {
  _$SongDetailsService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = SongDetailsService;

  @override
  Future<Response<SongDetailsResponce>> getSongInfo(String id) {
    final Uri $url =
        Uri.parse('https://genius-song-lyrics1.p.rapidapi.com/song/details/');
    final Map<String, dynamic> $params = <String, dynamic>{'id': id};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<SongDetailsResponce, SongDetailsResponce>($request);
  }
}
