import 'package:freezed_annotation/freezed_annotation.dart';
part 'genres_model.freezed.dart';
part 'genres_model.g.dart';

@freezed
class GenresResponse with _$GenresResponse {
  factory GenresResponse({
    required Content content,
  }) = _GenresResponse;
  static const fromJsonFactory = _$GenresResponseFromJson;
  factory GenresResponse.fromJson(Map<String, Object?> json) =>
      _$GenresResponseFromJson(json);
}

@freezed
class Content with _$Content {
  factory Content({required List<Items> items}) = _Content;

  factory Content.fromJson(Map<String, Object?> json) =>
      _$ContentFromJson(json);
}

@freezed
class Items with _$Items {
  factory Items({required String? name, required List<Images> images}) = _Items;

  factory Items.fromJson(Map<String, Object?> json) => _$ItemsFromJson(json);
}

@freezed
class Images with _$Images {
  factory Images({
    required String? url,
  }) = _Images;

  factory Images.fromJson(Map<String, Object?> json) => _$ImagesFromJson(json);
}
