import 'package:freezed_annotation/freezed_annotation.dart';
part 'genres_model.freezed.dart';
part 'genres_model.g.dart';

@freezed
class GenresResponse with _$GenresResponse {
  factory GenresResponse({required List<Data> data}) = _GenresResponse;
  static const fromJsonFactory = _$GenresResponseFromJson;
  factory GenresResponse.fromJson(Map<String, Object?> json) =>
      _$GenresResponseFromJson(json);
}

@freezed
class Data with _$Data {
  factory Data(
      {required int id,
      required String name,
      // ignore: invalid_annotation_target
      @JsonKey(name: 'picture_big') required String image}) = _Data;

  factory Data.fromJson(Map<String, Object?> json) => _$DataFromJson(json);
}
