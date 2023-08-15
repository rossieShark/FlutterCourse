// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SongDetailsResponce _$$_SongDetailsResponceFromJson(
        Map<String, dynamic> json) =>
    _$_SongDetailsResponce(
      song: SongDetail.fromJson(json['song'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SongDetailsResponceToJson(
        _$_SongDetailsResponce instance) =>
    <String, dynamic>{
      'song': instance.song,
    };

_$_SongDetail _$$_SongDetailFromJson(Map<String, dynamic> json) =>
    _$_SongDetail(
      artist_names: json['artist_names'] as String?,
      header_image_url: json['header_image_url'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$_SongDetailToJson(_$_SongDetail instance) =>
    <String, dynamic>{
      'artist_names': instance.artist_names,
      'header_image_url': instance.header_image_url,
      'title': instance.title,
    };
