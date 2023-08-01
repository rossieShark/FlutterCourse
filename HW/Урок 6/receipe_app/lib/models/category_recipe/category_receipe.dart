import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_receipe.freezed.dart';
part 'category_receipe.g.dart';

@freezed
class CategoryRecipeResponce with _$CategoryRecipeResponce {
  factory CategoryRecipeResponce({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'browse-categories')
    required List<CategoryData> browseCategories,
  }) = _CategoryReceipeResponce;
  static const fromJsonFactory = _$CategoryRecipeResponceFromJson;
  factory CategoryRecipeResponce.fromJson(Map<String, Object?> json) =>
      _$CategoryRecipeResponceFromJson(json);
}

@freezed
class CategoryData with _$CategoryData {
  factory CategoryData({
    required CategoryDisplay display,
  }) = _CategoryData;

  factory CategoryData.fromJson(Map<String, Object?> json) =>
      _$CategoryDataFromJson(json);
}

@freezed
class CategoryDisplay with _$CategoryDisplay {
  factory CategoryDisplay({
    required String displayName,
    required String categoryImage,
  }) = _CategoryDisplay;

  factory CategoryDisplay.fromJson(Map<String, Object?> json) =>
      _$CategoryDisplayFromJson(json);
}
