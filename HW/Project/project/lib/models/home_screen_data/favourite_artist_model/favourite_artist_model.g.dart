// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_artist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FavouriteArtistResponse _$$_FavouriteArtistResponseFromJson(
        Map<String, dynamic> json) =>
    _$_FavouriteArtistResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => Artists.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_FavouriteArtistResponseToJson(
        _$_FavouriteArtistResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$_Artists _$$_ArtistsFromJson(Map<String, dynamic> json) => _$_Artists(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['picture_big'] as String,
    );

Map<String, dynamic> _$$_ArtistsToJson(_$_Artists instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'picture_big': instance.image,
    };
