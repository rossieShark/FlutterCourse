import 'package:freezed_annotation/freezed_annotation.dart';
part 'detail_album_model.freezed.dart';
part 'detail_album_model.g.dart';

@freezed
class AlbumDetailsResponce with _$AlbumDetailsResponce {
  factory AlbumDetailsResponce({
    required List<AlbumAppearances> album_appearances,
  }) = _AlbumDetailsResponce;
  static const fromJsonFactory = _$AlbumDetailsResponceFromJson;
  factory AlbumDetailsResponce.fromJson(Map<String, Object?> json) =>
      _$AlbumDetailsResponceFromJson(json);
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
      {required String? artist_names,
      required String? title,
      required String? header_image_url,
      required String? song_art_image_url,
      required String? release_date_for_display,
      required int id}) = _Song;

  factory Song.fromJson(Map<String, Object?> json) => _$SongFromJson(json);
}
