// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_receipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryReceipeResponce _$$_CategoryReceipeResponceFromJson(
        Map<String, dynamic> json) =>
    _$_CategoryReceipeResponce(
      browseCategories: (json['browse-categories'] as List<dynamic>)
          .map((e) => CategoryData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CategoryReceipeResponceToJson(
        _$_CategoryReceipeResponce instance) =>
    <String, dynamic>{
      'browse-categories': instance.browseCategories,
    };

_$_CategoryData _$$_CategoryDataFromJson(Map<String, dynamic> json) =>
    _$_CategoryData(
      display:
          CategoryDisplay.fromJson(json['display'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CategoryDataToJson(_$_CategoryData instance) =>
    <String, dynamic>{
      'display': instance.display,
    };

_$_CategoryDisplay _$$_CategoryDisplayFromJson(Map<String, dynamic> json) =>
    _$_CategoryDisplay(
      displayName: json['displayName'] as String,
      categoryImage: json['categoryImage'] as String,
    );

Map<String, dynamic> _$$_CategoryDisplayToJson(_$_CategoryDisplay instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'categoryImage': instance.categoryImage,
    };
