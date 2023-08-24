// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_artist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FavouriteArtistResponse _$$_FavouriteArtistResponseFromJson(
        Map<String, dynamic> json) =>
    _$_FavouriteArtistResponse(
      chartItems: (json['chart_items'] as List<dynamic>)
          .map((e) => Artists.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_FavouriteArtistResponseToJson(
        _$_FavouriteArtistResponse instance) =>
    <String, dynamic>{
      'chart_items': instance.chartItems,
    };

_$_Artists _$$_ArtistsFromJson(Map<String, dynamic> json) => _$_Artists(
      item: Item.fromJson(json['item'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ArtistsToJson(_$_Artists instance) =>
    <String, dynamic>{
      'item': instance.item,
    };

_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      name: json['name'] as String?,
      imageUrl: json['image_url'] as String?,
      id: json['id'] as int,
    );

Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'name': instance.name,
      'image_url': instance.imageUrl,
      'id': instance.id,
    };
