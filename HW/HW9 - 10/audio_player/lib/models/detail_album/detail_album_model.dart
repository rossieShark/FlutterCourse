// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'detail_album_model.freezed.dart';
part 'detail_album_model.g.dart';

@freezed
class AlbumDetailsResponse with _$AlbumDetailsResponse {
  factory AlbumDetailsResponse({
    @JsonKey(name: 'album_appearances')
    required List<AlbumAppearances> albumAppearances,
  }) = _AlbumDetailsResponce;
  static const fromJsonFactory = _$AlbumDetailsResponseFromJson;
  factory AlbumDetailsResponse.fromJson(Map<String, Object?> json) =>
      _$AlbumDetailsResponseFromJson(json);
}

@freezed
class AlbumAppearances with _$AlbumAppearances {
  factory AlbumAppearances({required Song song}) = _AlbumAppearances;

  factory AlbumAppearances.fromJson(Map<String, Object?> json) =>
      _$AlbumAppearancesFromJson(json);
}

@freezed
class Song with _$Song {
  factory Song(
      {@JsonKey(name: 'artist_names') required String? artistNames,
      required String? title,
      @JsonKey(name: 'header_image_url') required String? headerImageUrl,
      @JsonKey(name: 'song_art_image_url') required String? songImage,
      @JsonKey(name: 'release_date_for_display') required String? releaseDate,
      required int id}) = _Song;

  factory Song.fromJson(Map<String, Object?> json) => _$SongFromJson(json);
}
