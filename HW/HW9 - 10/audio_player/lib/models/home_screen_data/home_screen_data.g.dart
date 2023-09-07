// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BestAlbumsResponse _$$_BestAlbumsResponseFromJson(
        Map<String, dynamic> json) =>
    _$_BestAlbumsResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => BestAlbumsList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BestAlbumsResponseToJson(
        _$_BestAlbumsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$_BestAlbumsList _$$_BestAlbumsListFromJson(Map<String, dynamic> json) =>
    _$_BestAlbumsList(
      artist: AlbumArtist.fromJson(json['artist'] as Map<String, dynamic>),
      id: json['id'] as int,
      coverImage: json['cover_xl'] as String,
      title: json['title'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$_BestAlbumsListToJson(_$_BestAlbumsList instance) =>
    <String, dynamic>{
      'artist': instance.artist,
      'id': instance.id,
      'cover_xl': instance.coverImage,
      'title': instance.title,
      'type': instance.type,
    };

_$_AlbumArtist _$$_AlbumArtistFromJson(Map<String, dynamic> json) =>
    _$_AlbumArtist(
      name: json['name'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$$_AlbumArtistToJson(_$_AlbumArtist instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };
