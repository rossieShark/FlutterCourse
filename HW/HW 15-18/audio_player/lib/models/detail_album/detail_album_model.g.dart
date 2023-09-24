// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_album_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AlbumDetailsResponce _$$_AlbumDetailsResponceFromJson(
        Map<String, dynamic> json) =>
    _$_AlbumDetailsResponce(
      data: (json['data'] as List<dynamic>)
          .map((e) => AlbumData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AlbumDetailsResponceToJson(
        _$_AlbumDetailsResponce instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$_AlbumData _$$_AlbumDataFromJson(Map<String, dynamic> json) => _$_AlbumData(
      id: json['id'] as int,
      title: json['title'] as String,
      type: json['type'] as String,
      preview: json['preview'] as String,
      artist: AlbumDataArtist.fromJson(json['artist'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AlbumDataToJson(_$_AlbumData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
      'preview': instance.preview,
      'artist': instance.artist,
    };

_$_AlbumDataArtist _$$_AlbumDataArtistFromJson(Map<String, dynamic> json) =>
    _$_AlbumDataArtist(
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_AlbumDataArtistToJson(_$_AlbumDataArtist instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
