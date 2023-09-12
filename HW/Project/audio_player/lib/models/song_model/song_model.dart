// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'song_model.freezed.dart';
part 'song_model.g.dart';

@freezed
class SongDetailsResponce with _$SongDetailsResponce {
  factory SongDetailsResponce(
      {required List<Artist> contributors,
      required String title,
      required String preview,
      required String type}) = _SongDetailsResponce;
  static const fromJsonFactory = _$SongDetailsResponceFromJson;
  factory SongDetailsResponce.fromJson(Map<String, Object?> json) =>
      _$SongDetailsResponceFromJson(json);
}

@freezed
class Artist with _$Artist {
  factory Artist(
      {required String name,
      @JsonKey(name: 'picture_big') required String image}) = _Artist;

  factory Artist.fromJson(Map<String, Object?> json) => _$ArtistFromJson(json);
}
