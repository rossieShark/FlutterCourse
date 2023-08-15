import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_result_model.freezed.dart';
part 'search_result_model.g.dart';

@freezed
class SearchResultResponce with _$SearchResultResponce {
  factory SearchResultResponce({
    required List<Hits> hits,
  }) = _SearchResultResponce;
  static const fromJsonFactory = _$SearchResultResponceFromJson;
  factory SearchResultResponce.fromJson(Map<String, Object?> json) =>
      _$SearchResultResponceFromJson(json);
}

@freezed
class Hits with _$Hits {
  factory Hits({
    required Result result,
  }) = _Hits;

  factory Hits.fromJson(Map<String, Object?> json) => _$HitsFromJson(json);
}

@freezed
class Result with _$Result {
  factory Result({
    required String? artist_names,
    required String? header_image_url,
    required String? title,
    required int id,
  }) = _Result;

  factory Result.fromJson(Map<String, Object?> json) => _$ResultFromJson(json);
}
