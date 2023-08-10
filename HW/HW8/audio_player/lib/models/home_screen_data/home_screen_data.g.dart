// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TracksResponce _$$_TracksResponceFromJson(Map<String, dynamic> json) =>
    _$_TracksResponce(
      chart_items: (json['chart_items'] as List<dynamic>)
          .map((e) => ChartItems.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TracksResponceToJson(_$_TracksResponce instance) =>
    <String, dynamic>{
      'chart_items': instance.chart_items,
    };

_$_ChartItems _$$_ChartItemsFromJson(Map<String, dynamic> json) =>
    _$_ChartItems(
      item: Item.fromJson(json['item'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ChartItemsToJson(_$_ChartItems instance) =>
    <String, dynamic>{
      'item': instance.item,
    };

_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      artist_names: json['artist_names'] as String?,
      name: json['name'] as String?,
      title: json['title'] as String?,
      header_image_url: json['header_image_url'] as String?,
      cover_art_url: json['cover_art_url'] as String?,
      release_date_for_display: json['release_date_for_display'] as String?,
      full_title: json['full_title'] as String?,
      image_url: json['image_url'] as String?,
      id: json['id'] as int,
    );

Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'artist_names': instance.artist_names,
      'name': instance.name,
      'title': instance.title,
      'header_image_url': instance.header_image_url,
      'cover_art_url': instance.cover_art_url,
      'release_date_for_display': instance.release_date_for_display,
      'full_title': instance.full_title,
      'image_url': instance.image_url,
      'id': instance.id,
    };
