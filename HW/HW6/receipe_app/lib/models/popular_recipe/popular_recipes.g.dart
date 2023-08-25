// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_recipes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReceipeResponce _$$_ReceipeResponceFromJson(Map<String, dynamic> json) =>
    _$_ReceipeResponce(
      feed: (json['feed'] as List<dynamic>)
          .map((e) => RecipeFeed.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ReceipeResponceToJson(_$_ReceipeResponce instance) =>
    <String, dynamic>{
      'feed': instance.feed,
    };

_$_ReceipeFeed _$$_ReceipeFeedFromJson(Map<String, dynamic> json) =>
    _$_ReceipeFeed(
      content: RecipeContent.fromJson(json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ReceipeFeedToJson(_$_ReceipeFeed instance) =>
    <String, dynamic>{
      'content': instance.content,
    };

_$_ReceipeContent _$$_ReceipeContentFromJson(Map<String, dynamic> json) =>
    _$_ReceipeContent(
      description: json['description'] == null
          ? null
          : RecipeContentDescription.fromJson(
              json['description'] as Map<String, dynamic>),
      details: RecipeContentDetails.fromJson(
          json['details'] as Map<String, dynamic>),
      preparationSteps: (json['preparationSteps'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      ingredientLines: (json['ingredientLines'] as List<dynamic>)
          .map((e) => IngredientLines.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ReceipeContentToJson(_$_ReceipeContent instance) =>
    <String, dynamic>{
      'description': instance.description,
      'details': instance.details,
      'preparationSteps': instance.preparationSteps,
      'ingredientLines': instance.ingredientLines,
    };

_$_RecipeContentDetails _$$_RecipeContentDetailsFromJson(
        Map<String, dynamic> json) =>
    _$_RecipeContentDetails(
      numberOfServings: json['numberOfServings'] as int?,
      totalTime: json['totalTime'] as String?,
      images: (json['images'] as List<dynamic>)
          .map((e) => RecipeImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      rating: (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$$_RecipeContentDetailsToJson(
        _$_RecipeContentDetails instance) =>
    <String, dynamic>{
      'numberOfServings': instance.numberOfServings,
      'totalTime': instance.totalTime,
      'images': instance.images,
      'name': instance.name,
      'rating': instance.rating,
    };

_$_RecipeImage _$$_RecipeImageFromJson(Map<String, dynamic> json) =>
    _$_RecipeImage(
      hostedLargeUrl: json['hostedLargeUrl'] as String,
    );

Map<String, dynamic> _$$_RecipeImageToJson(_$_RecipeImage instance) =>
    <String, dynamic>{
      'hostedLargeUrl': instance.hostedLargeUrl,
    };

_$_IngredientLines _$$_IngredientLinesFromJson(Map<String, dynamic> json) =>
    _$_IngredientLines(
      unit: json['unit'] as String?,
      quantity: (json['quantity'] as num?)?.toDouble(),
      ingredient: json['ingredient'] as String?,
    );

Map<String, dynamic> _$$_IngredientLinesToJson(_$_IngredientLines instance) =>
    <String, dynamic>{
      'unit': instance.unit,
      'quantity': instance.quantity,
      'ingredient': instance.ingredient,
    };

_$_ReceipeContentDescription _$$_ReceipeContentDescriptionFromJson(
        Map<String, dynamic> json) =>
    _$_ReceipeContentDescription(
      text: json['text'] as String?,
    );

Map<String, dynamic> _$$_ReceipeContentDescriptionToJson(
        _$_ReceipeContentDescription instance) =>
    <String, dynamic>{
      'text': instance.text,
    };
