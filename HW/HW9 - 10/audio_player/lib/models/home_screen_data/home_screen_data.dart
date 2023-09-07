// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_screen_data.freezed.dart';
part 'home_screen_data.g.dart';

@freezed
class BestAlbumsResponse with _$BestAlbumsResponse {
  factory BestAlbumsResponse({
    required List<BestAlbumsList> data,
  }) = _BestAlbumsResponse;
  static const fromJsonFactory = _$BestAlbumsResponseFromJson;
  factory BestAlbumsResponse.fromJson(Map<String, Object?> json) =>
      _$BestAlbumsResponseFromJson(json);
}

@freezed
class BestAlbumsList with _$BestAlbumsList {
  factory BestAlbumsList({
    required AlbumArtist artist,
    required int id,
    @JsonKey(name: 'cover_xl') required String coverImage,
    required String title,
    required String type,
  }) = _BestAlbumsList;

  factory BestAlbumsList.fromJson(Map<String, Object?> json) =>
      _$BestAlbumsListFromJson(json);
}

@freezed
class AlbumArtist with _$AlbumArtist {
  factory AlbumArtist({required String name, required int id}) = _AlbumArtist;

  factory AlbumArtist.fromJson(Map<String, Object?> json) =>
      _$AlbumArtistFromJson(json);
}
