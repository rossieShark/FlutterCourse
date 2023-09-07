// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recently_played_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecentlyPlayedResponse _$$_RecentlyPlayedResponseFromJson(
        Map<String, dynamic> json) =>
    _$_RecentlyPlayedResponse(
      tracks: Tracks.fromJson(json['tracks'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RecentlyPlayedResponseToJson(
        _$_RecentlyPlayedResponse instance) =>
    <String, dynamic>{
      'tracks': instance.tracks,
    };

_$_Tracks _$$_TracksFromJson(Map<String, dynamic> json) => _$_Tracks(
      data: (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TracksToJson(_$_Tracks instance) => <String, dynamic>{
      'data': instance.data,
    };

_$_Data _$$_DataFromJson(Map<String, dynamic> json) => _$_Data(
      title: json['title'] as String,
      artist: Artist.fromJson(json['artist'] as Map<String, dynamic>),
      id: json['id'] as int,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$_DataToJson(_$_Data instance) => <String, dynamic>{
      'title': instance.title,
      'artist': instance.artist,
      'id': instance.id,
      'type': instance.type,
    };

_$_Artist _$$_ArtistFromJson(Map<String, dynamic> json) => _$_Artist(
      name: json['name'] as String,
      image: json['picture_big'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$$_ArtistToJson(_$_Artist instance) => <String, dynamic>{
      'name': instance.name,
      'picture_big': instance.image,
      'id': instance.id,
    };
