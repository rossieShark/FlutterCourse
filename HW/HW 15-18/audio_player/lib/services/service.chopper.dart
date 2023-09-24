// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$AudioPlayerService extends AudioPlayerService {
  _$AudioPlayerService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = AudioPlayerService;

  @override
  Future<Response<AlbumDetailsResponse>> getAlbumSongsList(String id) {
    final Uri $url = Uri.parse('https://api.deezer.com/album/${id}/tracks');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<AlbumDetailsResponse, AlbumDetailsResponse>($request);
  }

  @override
  Future<Response<GenresResponse>> getGenres() {
    final Uri $url = Uri.parse('https://api.deezer.com/genre');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<GenresResponse, GenresResponse>($request);
  }

  @override
  Future<Response<RecentlyPlayedResponse>> getRecentlyPlayedTracks() {
    final Uri $url = Uri.parse('https://api.deezer.com/chart/tracks');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<RecentlyPlayedResponse, RecentlyPlayedResponse>($request);
  }

  @override
  Future<Response<FavouriteArtistResponse>> getFavoriteArtists() {
    final Uri $url = Uri.parse('https://api.deezer.com/chart/0/artists');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<FavouriteArtistResponse, FavouriteArtistResponse>($request);
  }

  @override
  Future<Response<BestAlbumsResponse>> getBestAlbums(
    int index,
    int limit,
  ) {
    final Uri $url = Uri.parse('https://api.deezer.com/chart/0/albums?');
    final Map<String, dynamic> $params = <String, dynamic>{
      'index': index,
      'limit': limit,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<BestAlbumsResponse, BestAlbumsResponse>($request);
  }

  @override
  Future<Response<SearchResultResponce>> getSearchResult(
    String query,
    int index,
    int limit,
  ) {
    final Uri $url = Uri.parse('https://api.deezer.com/search?');
    final Map<String, dynamic> $params = <String, dynamic>{
      'q': query,
      'index': index,
      'limit': limit,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<SearchResultResponce, SearchResultResponce>($request);
  }

  @override
  Future<Response<SongDetailsResponce>> getDetailSongs(String id) {
    final Uri $url = Uri.parse('https://api.deezer.com/track/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<SongDetailsResponce, SongDetailsResponce>($request);
  }
}
