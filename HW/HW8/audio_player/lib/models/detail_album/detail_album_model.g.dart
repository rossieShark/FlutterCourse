// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_album_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AlbumDetailsResponce _$$_AlbumDetailsResponceFromJson(
        Map<String, dynamic> json) =>
    _$_AlbumDetailsResponce(
      album_appearances: (json['album_appearances'] as List<dynamic>)
          .map((e) => AlbumAppearances.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AlbumDetailsResponceToJson(
        _$_AlbumDetailsResponce instance) =>
    <String, dynamic>{
      'album_appearances': instance.album_appearances,
    };

_$_AlbumAppearances _$$_AlbumAppearancesFromJson(Map<String, dynamic> json) =>
    _$_AlbumAppearances(
      song: Song.fromJson(json['song'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AlbumAppearancesToJson(_$_AlbumAppearances instance) =>
    <String, dynamic>{
      'song': instance.song,
    };

_$_Song _$$_SongFromJson(Map<String, dynamic> json) => _$_Song(
      artist_names: json['artist_names'] as String?,
      title: json['title'] as String?,
      header_image_url: json['header_image_url'] as String?,
      song_art_image_url: json['song_art_image_url'] as String?,
      release_date_for_display: json['release_date_for_display'] as String?,
      id: json['id'] as int,
    );

Map<String, dynamic> _$$_SongToJson(_$_Song instance) => <String, dynamic>{
      'artist_names': instance.artist_names,
      'title': instance.title,
      'header_image_url': instance.header_image_url,
      'song_art_image_url': instance.song_art_image_url,
      'release_date_for_display': instance.release_date_for_display,
      'id': instance.id,
    };
