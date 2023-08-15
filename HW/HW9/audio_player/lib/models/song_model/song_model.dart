import 'package:freezed_annotation/freezed_annotation.dart';

part 'song_model.freezed.dart';
part 'song_model.g.dart';

@freezed
class SongDetailsResponce with _$SongDetailsResponce {
  factory SongDetailsResponce({
    required SongDetail song,
  }) = _SongDetailsResponce;
  static const fromJsonFactory = _$SongDetailsResponceFromJson;
  factory SongDetailsResponce.fromJson(Map<String, Object?> json) =>
      _$SongDetailsResponceFromJson(json);
}

@freezed
class SongDetail with _$SongDetail {
  factory SongDetail({
    required String? artist_names,
    required String? header_image_url,
    required String? title,
  }) = _SongDetail;

  factory SongDetail.fromJson(Map<String, Object?> json) =>
      _$SongDetailFromJson(json);
}
