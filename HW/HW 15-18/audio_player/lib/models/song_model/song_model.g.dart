// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SongDetailsResponce _$$_SongDetailsResponceFromJson(
        Map<String, dynamic> json) =>
    _$_SongDetailsResponce(
      contributors: (json['contributors'] as List<dynamic>)
          .map((e) => Artist.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String,
      preview: json['preview'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$_SongDetailsResponceToJson(
        _$_SongDetailsResponce instance) =>
    <String, dynamic>{
      'contributors': instance.contributors,
      'title': instance.title,
      'preview': instance.preview,
      'type': instance.type,
    };

_$_Artist _$$_ArtistFromJson(Map<String, dynamic> json) => _$_Artist(
      name: json['name'] as String,
      image: json['picture_big'] as String,
    );

Map<String, dynamic> _$$_ArtistToJson(_$_Artist instance) => <String, dynamic>{
      'name': instance.name,
      'picture_big': instance.image,
    };
