import 'package:freezed_annotation/freezed_annotation.dart';

part 'popular_recipes.freezed.dart';
part 'popular_recipes.g.dart';

@freezed
class RecipeResponce with _$RecipeResponce {
  factory RecipeResponce({
    required List<RecipeFeed> feed,
    //required String? page,
  }) = _ReceipeResponce;
  static const fromJsonFactory = _$RecipeResponceFromJson;
  factory RecipeResponce.fromJson(Map<String, Object?> json) =>
      _$RecipeResponceFromJson(json);
}

@freezed
class RecipeFeed with _$RecipeFeed {
  factory RecipeFeed({
    required RecipeContent content,
  }) = _ReceipeFeed;

  factory RecipeFeed.fromJson(Map<String, Object?> json) =>
      _$RecipeFeedFromJson(json);
}

@freezed
class RecipeContent with _$RecipeContent {
  factory RecipeContent({
    required RecipeContentDescription? description,
    required RecipeContentDetails details,
    required List<String>? preparationSteps,
    required List<IngredientLines> ingredientLines,
  }) = _ReceipeContent;

  factory RecipeContent.fromJson(Map<String, Object?> json) =>
      _$RecipeContentFromJson(json);
}

@freezed
class RecipeContentDetails with _$RecipeContentDetails {
  factory RecipeContentDetails({
    required int? numberOfServings,
    required String? totalTime,
    required List<RecipeImage> images,
    required String name,
    required double rating,
  }) = _RecipeContentDetails;

  factory RecipeContentDetails.fromJson(Map<String, Object?> json) =>
      _$RecipeContentDetailsFromJson(json);
}

@freezed
class RecipeImage with _$RecipeImage {
  factory RecipeImage({
    required String hostedLargeUrl,
  }) = _RecipeImage;

  factory RecipeImage.fromJson(Map<String, Object?> json) =>
      _$RecipeImageFromJson(json);
}

@freezed
class IngredientLines with _$IngredientLines {
  factory IngredientLines({
    required String? unit,
    required double? quantity,
    required String? ingredient,
  }) = _IngredientLines;

  factory IngredientLines.fromJson(Map<String, Object?> json) =>
      _$IngredientLinesFromJson(json);
}

@freezed
class RecipeContentDescription with _$RecipeContentDescription {
  factory RecipeContentDescription({
    required String? text,
  }) = _ReceipeContentDescription;

  factory RecipeContentDescription.fromJson(Map<String, Object?> json) =>
      _$RecipeContentDescriptionFromJson(json);
}
