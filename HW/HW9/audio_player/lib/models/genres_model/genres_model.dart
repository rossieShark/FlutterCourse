import 'package:freezed_annotation/freezed_annotation.dart';
part 'genres_model.freezed.dart';
part 'genres_model.g.dart';

@freezed
class GenresResponce with _$GenresResponce {
  factory GenresResponce({
    required Content content,
  }) = _GenresResponce;
  static const fromJsonFactory = _$GenresResponceFromJson;
  factory GenresResponce.fromJson(Map<String, Object?> json) =>
      _$GenresResponceFromJson(json);
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
