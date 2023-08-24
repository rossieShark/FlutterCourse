// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recently_played_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecentlyPlayedResponse _$$_RecentlyPlayedResponseFromJson(
        Map<String, dynamic> json) =>
    _$_RecentlyPlayedResponse(
      charItems: (json['chart_items'] as List<dynamic>)
          .map((e) => RecentlyPlayedlist.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RecentlyPlayedResponseToJson(
        _$_RecentlyPlayedResponse instance) =>
    <String, dynamic>{
      'chart_items': instance.charItems,
    };

_$_RecentlyPlayedlist _$$_RecentlyPlayedlistFromJson(
        Map<String, dynamic> json) =>
    _$_RecentlyPlayedlist(
      item: Item.fromJson(json['item'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RecentlyPlayedlistToJson(
        _$_RecentlyPlayedlist instance) =>
    <String, dynamic>{
      'item': instance.item,
    };

_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      artistNames: json['artist_names'] as String?,
      title: json['title'] as String?,
      imageUrl: json['header_image_url'] as String?,
      id: json['id'] as int,
    );

Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'artist_names': instance.artistNames,
      'title': instance.title,
      'header_image_url': instance.imageUrl,
      'id': instance.id,
    };
