// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_result_model.freezed.dart';
part 'search_result_model.g.dart';

@freezed
class SearchResultResponce with _$SearchResultResponce {
  factory SearchResultResponce({
    required List<SearchData> data,
  }) = _SearchResultResponce;
  static const fromJsonFactory = _$SearchResultResponceFromJson;
  factory SearchResultResponce.fromJson(Map<String, Object?> json) =>
      _$SearchResultResponceFromJson(json);
}

@freezed
class SearchData with _$SearchData {
  factory SearchData({
    required int id,
    required String title,
    required String type,
    required SearchDataArtist artist,
  }) = _SearchData;

  factory SearchData.fromJson(Map<String, Object?> json) =>
      _$SearchDataFromJson(json);
}

@freezed
class SearchDataArtist with _$SearchDataArtist {
  factory SearchDataArtist({
    @JsonKey(name: 'picture_big') required String image,
    required String name,
  }) = _SearchDataArtist;

  factory SearchDataArtist.fromJson(Map<String, Object?> json) =>
      _$SearchDataArtistFromJson(json);
}
