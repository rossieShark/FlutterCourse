// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchResultResponce _$$_SearchResultResponceFromJson(
        Map<String, dynamic> json) =>
    _$_SearchResultResponce(
      hits: (json['hits'] as List<dynamic>)
          .map((e) => Hits.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SearchResultResponceToJson(
        _$_SearchResultResponce instance) =>
    <String, dynamic>{
      'hits': instance.hits,
    };

_$_Hits _$$_HitsFromJson(Map<String, dynamic> json) => _$_Hits(
      result: Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_HitsToJson(_$_Hits instance) => <String, dynamic>{
      'result': instance.result,
    };

_$_Result _$$_ResultFromJson(Map<String, dynamic> json) => _$_Result(
      artist_names: json['artist_names'] as String?,
      header_image_url: json['header_image_url'] as String?,
      title: json['title'] as String?,
      id: json['id'] as int,
    );

Map<String, dynamic> _$$_ResultToJson(_$_Result instance) => <String, dynamic>{
      'artist_names': instance.artist_names,
      'header_image_url': instance.header_image_url,
      'title': instance.title,
      'id': instance.id,
    };
