// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_album_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AlbumDetailsResponce _$$_AlbumDetailsResponceFromJson(
        Map<String, dynamic> json) =>
    _$_AlbumDetailsResponce(
      albumAppearances: (json['album_appearances'] as List<dynamic>)
          .map((e) => AlbumAppearances.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AlbumDetailsResponceToJson(
        _$_AlbumDetailsResponce instance) =>
    <String, dynamic>{
      'album_appearances': instance.albumAppearances,
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
      artistNames: json['artist_names'] as String?,
      title: json['title'] as String?,
      headerImageUrl: json['header_image_url'] as String?,
      songImage: json['song_art_image_url'] as String?,
      releaseDate: json['release_date_for_display'] as String?,
      id: json['id'] as int,
    );

Map<String, dynamic> _$$_SongToJson(_$_Song instance) => <String, dynamic>{
      'artist_names': instance.artistNames,
      'title': instance.title,
      'header_image_url': instance.headerImageUrl,
      'song_art_image_url': instance.songImage,
      'release_date_for_display': instance.releaseDate,
      'id': instance.id,
    };
