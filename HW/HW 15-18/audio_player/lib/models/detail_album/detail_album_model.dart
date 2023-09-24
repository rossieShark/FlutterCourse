import 'package:freezed_annotation/freezed_annotation.dart';
part 'detail_album_model.freezed.dart';
part 'detail_album_model.g.dart';

@freezed
class AlbumDetailsResponse with _$AlbumDetailsResponse {
  factory AlbumDetailsResponse({
    required List<AlbumData> data,
  }) = _AlbumDetailsResponce;
  static const fromJsonFactory = _$AlbumDetailsResponseFromJson;
  factory AlbumDetailsResponse.fromJson(Map<String, Object?> json) =>
      _$AlbumDetailsResponseFromJson(json);
}

@freezed
class AlbumData with _$AlbumData {
  factory AlbumData(
      {required int id,
      required String title,
      required String type,
      required String preview,
      required AlbumDataArtist artist}) = _AlbumData;

  factory AlbumData.fromJson(Map<String, Object?> json) =>
      _$AlbumDataFromJson(json);
}

@freezed
class AlbumDataArtist with _$AlbumDataArtist {
  factory AlbumDataArtist({required String name}) = _AlbumDataArtist;

  factory AlbumDataArtist.fromJson(Map<String, Object?> json) =>
      _$AlbumDataArtistFromJson(json);
}
