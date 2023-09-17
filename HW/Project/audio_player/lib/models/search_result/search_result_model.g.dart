// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchResultResponce _$$_SearchResultResponceFromJson(
        Map<String, dynamic> json) =>
    _$_SearchResultResponce(
      data: (json['data'] as List<dynamic>)
          .map((e) => SearchData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SearchResultResponceToJson(
        _$_SearchResultResponce instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$_SearchData _$$_SearchDataFromJson(Map<String, dynamic> json) =>
    _$_SearchData(
      id: json['id'] as int,
      title: json['title'] as String,
      type: json['type'] as String,
      preview: json['preview'] as String,
      artist: SearchDataArtist.fromJson(json['artist'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SearchDataToJson(_$_SearchData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
      'preview': instance.preview,
      'artist': instance.artist,
    };

_$_SearchDataArtist _$$_SearchDataArtistFromJson(Map<String, dynamic> json) =>
    _$_SearchDataArtist(
      image: json['picture_big'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_SearchDataArtistToJson(_$_SearchDataArtist instance) =>
    <String, dynamic>{
      'picture_big': instance.image,
      'name': instance.name,
    };
