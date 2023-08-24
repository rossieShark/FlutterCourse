// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BestAlbumsResponse _$$_BestAlbumsResponseFromJson(
        Map<String, dynamic> json) =>
    _$_BestAlbumsResponse(
      chartItems: (json['chart_items'] as List<dynamic>)
          .map((e) => BestAlbumsList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BestAlbumsResponseToJson(
        _$_BestAlbumsResponse instance) =>
    <String, dynamic>{
      'chart_items': instance.chartItems,
    };

_$_BestAlbumsList _$$_BestAlbumsListFromJson(Map<String, dynamic> json) =>
    _$_BestAlbumsList(
      item: Item.fromJson(json['item'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BestAlbumsListToJson(_$_BestAlbumsList instance) =>
    <String, dynamic>{
      'item': instance.item,
    };

_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      coverImage: json['cover_art_url'] as String?,
      releaseDate: json['release_date_for_display'] as String?,
      fullTitle: json['full_title'] as String?,
      id: json['id'] as int,
    );

Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'cover_art_url': instance.coverImage,
      'release_date_for_display': instance.releaseDate,
      'full_title': instance.fullTitle,
      'id': instance.id,
    };
