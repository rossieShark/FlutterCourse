// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, duplicate_ignore
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_album_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AlbumDetailsResponce _$AlbumDetailsResponceFromJson(Map<String, dynamic> json) {
  return _AlbumDetailsResponce.fromJson(json);
}

/// @nodoc
mixin _$AlbumDetailsResponce {
// ignore: invalid_annotation_target
  List<AlbumAppearances> get album_appearances =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlbumDetailsResponceCopyWith<AlbumDetailsResponce> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumDetailsResponceCopyWith<$Res> {
  factory $AlbumDetailsResponceCopyWith(AlbumDetailsResponce value,
          $Res Function(AlbumDetailsResponce) then) =
      _$AlbumDetailsResponceCopyWithImpl<$Res, AlbumDetailsResponce>;
  @useResult
  $Res call({List<AlbumAppearances> album_appearances});
}

/// @nodoc
class _$AlbumDetailsResponceCopyWithImpl<$Res,
        $Val extends AlbumDetailsResponce>
    implements $AlbumDetailsResponceCopyWith<$Res> {
  _$AlbumDetailsResponceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? album_appearances = null,
  }) {
    return _then(_value.copyWith(
      album_appearances: null == album_appearances
          ? _value.album_appearances
          : album_appearances // ignore: cast_nullable_to_non_nullable
              as List<AlbumAppearances>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AlbumDetailsResponceCopyWith<$Res>
    implements $AlbumDetailsResponceCopyWith<$Res> {
  factory _$$_AlbumDetailsResponceCopyWith(_$_AlbumDetailsResponce value,
          $Res Function(_$_AlbumDetailsResponce) then) =
      __$$_AlbumDetailsResponceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AlbumAppearances> album_appearances});
}

/// @nodoc
class __$$_AlbumDetailsResponceCopyWithImpl<$Res>
    extends _$AlbumDetailsResponceCopyWithImpl<$Res, _$_AlbumDetailsResponce>
    implements _$$_AlbumDetailsResponceCopyWith<$Res> {
  __$$_AlbumDetailsResponceCopyWithImpl(_$_AlbumDetailsResponce _value,
      $Res Function(_$_AlbumDetailsResponce) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? album_appearances = null,
  }) {
    return _then(_$_AlbumDetailsResponce(
      album_appearances: null == album_appearances
          ? _value._album_appearances
          : album_appearances // ignore: cast_nullable_to_non_nullable
              as List<AlbumAppearances>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AlbumDetailsResponce implements _AlbumDetailsResponce {
  _$_AlbumDetailsResponce(
      {required final List<AlbumAppearances> album_appearances})
      : _album_appearances = album_appearances;

  factory _$_AlbumDetailsResponce.fromJson(Map<String, dynamic> json) =>
      _$$_AlbumDetailsResponceFromJson(json);

// ignore: invalid_annotation_target
  final List<AlbumAppearances> _album_appearances;
// ignore: invalid_annotation_target
  @override
  List<AlbumAppearances> get album_appearances {
    if (_album_appearances is EqualUnmodifiableListView)
      return _album_appearances;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_album_appearances);
  }

  @override
  String toString() {
    return 'AlbumDetailsResponce(album_appearances: $album_appearances)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AlbumDetailsResponce &&
            const DeepCollectionEquality()
                .equals(other._album_appearances, _album_appearances));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_album_appearances));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AlbumDetailsResponceCopyWith<_$_AlbumDetailsResponce> get copyWith =>
      __$$_AlbumDetailsResponceCopyWithImpl<_$_AlbumDetailsResponce>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AlbumDetailsResponceToJson(
      this,
    );
  }
}

abstract class _AlbumDetailsResponce implements AlbumDetailsResponce {
  factory _AlbumDetailsResponce(
          {required final List<AlbumAppearances> album_appearances}) =
      _$_AlbumDetailsResponce;

  factory _AlbumDetailsResponce.fromJson(Map<String, dynamic> json) =
      _$_AlbumDetailsResponce.fromJson;

  @override // ignore: invalid_annotation_target
  List<AlbumAppearances> get album_appearances;
  @override
  @JsonKey(ignore: true)
  _$$_AlbumDetailsResponceCopyWith<_$_AlbumDetailsResponce> get copyWith =>
      throw _privateConstructorUsedError;
}

AlbumAppearances _$AlbumAppearancesFromJson(Map<String, dynamic> json) {
  return _AlbumAppearances.fromJson(json);
}

/// @nodoc
mixin _$AlbumAppearances {
  Song get song => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlbumAppearancesCopyWith<AlbumAppearances> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumAppearancesCopyWith<$Res> {
  factory $AlbumAppearancesCopyWith(
          AlbumAppearances value, $Res Function(AlbumAppearances) then) =
      _$AlbumAppearancesCopyWithImpl<$Res, AlbumAppearances>;
  @useResult
  $Res call({Song song});

  $SongCopyWith<$Res> get song;
}

/// @nodoc
class _$AlbumAppearancesCopyWithImpl<$Res, $Val extends AlbumAppearances>
    implements $AlbumAppearancesCopyWith<$Res> {
  _$AlbumAppearancesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? song = null,
  }) {
    return _then(_value.copyWith(
      song: null == song
          ? _value.song
          : song // ignore: cast_nullable_to_non_nullable
              as Song,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SongCopyWith<$Res> get song {
    return $SongCopyWith<$Res>(_value.song, (value) {
      return _then(_value.copyWith(song: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AlbumAppearancesCopyWith<$Res>
    implements $AlbumAppearancesCopyWith<$Res> {
  factory _$$_AlbumAppearancesCopyWith(
          _$_AlbumAppearances value, $Res Function(_$_AlbumAppearances) then) =
      __$$_AlbumAppearancesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Song song});

  @override
  $SongCopyWith<$Res> get song;
}

/// @nodoc
class __$$_AlbumAppearancesCopyWithImpl<$Res>
    extends _$AlbumAppearancesCopyWithImpl<$Res, _$_AlbumAppearances>
    implements _$$_AlbumAppearancesCopyWith<$Res> {
  __$$_AlbumAppearancesCopyWithImpl(
      _$_AlbumAppearances _value, $Res Function(_$_AlbumAppearances) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? song = null,
  }) {
    return _then(_$_AlbumAppearances(
      song: null == song
          ? _value.song
          : song // ignore: cast_nullable_to_non_nullable
              as Song,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AlbumAppearances implements _AlbumAppearances {
  _$_AlbumAppearances({required this.song});

  factory _$_AlbumAppearances.fromJson(Map<String, dynamic> json) =>
      _$$_AlbumAppearancesFromJson(json);

  @override
  final Song song;

  @override
  String toString() {
    return 'AlbumAppearances(song: $song)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AlbumAppearances &&
            (identical(other.song, song) || other.song == song));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, song);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AlbumAppearancesCopyWith<_$_AlbumAppearances> get copyWith =>
      __$$_AlbumAppearancesCopyWithImpl<_$_AlbumAppearances>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AlbumAppearancesToJson(
      this,
    );
  }
}

abstract class _AlbumAppearances implements AlbumAppearances {
  factory _AlbumAppearances({required final Song song}) = _$_AlbumAppearances;

  factory _AlbumAppearances.fromJson(Map<String, dynamic> json) =
      _$_AlbumAppearances.fromJson;

  @override
  Song get song;
  @override
  @JsonKey(ignore: true)
  _$$_AlbumAppearancesCopyWith<_$_AlbumAppearances> get copyWith =>
      throw _privateConstructorUsedError;
}

Song _$SongFromJson(Map<String, dynamic> json) {
  return _Song.fromJson(json);
}

/// @nodoc
mixin _$Song {
  String? get artist_names =>
      throw _privateConstructorUsedError; //required String? name,
  String? get title => throw _privateConstructorUsedError;
  String? get header_image_url => throw _privateConstructorUsedError;
  String? get song_art_image_url => throw _privateConstructorUsedError;
  String? get release_date_for_display =>
      throw _privateConstructorUsedError; //required String? full_title,
//required String? image_url,
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SongCopyWith<Song> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongCopyWith<$Res> {
  factory $SongCopyWith(Song value, $Res Function(Song) then) =
      _$SongCopyWithImpl<$Res, Song>;
  @useResult
  $Res call(
      {String? artist_names,
      String? title,
      String? header_image_url,
      String? song_art_image_url,
      String? release_date_for_display,
      int id});
}

/// @nodoc
class _$SongCopyWithImpl<$Res, $Val extends Song>
    implements $SongCopyWith<$Res> {
  _$SongCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artist_names = freezed,
    Object? title = freezed,
    Object? header_image_url = freezed,
    Object? song_art_image_url = freezed,
    Object? release_date_for_display = freezed,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      artist_names: freezed == artist_names
          ? _value.artist_names
          : artist_names // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      header_image_url: freezed == header_image_url
          ? _value.header_image_url
          : header_image_url // ignore: cast_nullable_to_non_nullable
              as String?,
      song_art_image_url: freezed == song_art_image_url
          ? _value.song_art_image_url
          : song_art_image_url // ignore: cast_nullable_to_non_nullable
              as String?,
      release_date_for_display: freezed == release_date_for_display
          ? _value.release_date_for_display
          : release_date_for_display // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SongCopyWith<$Res> implements $SongCopyWith<$Res> {
  factory _$$_SongCopyWith(_$_Song value, $Res Function(_$_Song) then) =
      __$$_SongCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? artist_names,
      String? title,
      String? header_image_url,
      String? song_art_image_url,
      String? release_date_for_display,
      int id});
}

/// @nodoc
class __$$_SongCopyWithImpl<$Res> extends _$SongCopyWithImpl<$Res, _$_Song>
    implements _$$_SongCopyWith<$Res> {
  __$$_SongCopyWithImpl(_$_Song _value, $Res Function(_$_Song) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artist_names = freezed,
    Object? title = freezed,
    Object? header_image_url = freezed,
    Object? song_art_image_url = freezed,
    Object? release_date_for_display = freezed,
    Object? id = null,
  }) {
    return _then(_$_Song(
      artist_names: freezed == artist_names
          ? _value.artist_names
          : artist_names // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      header_image_url: freezed == header_image_url
          ? _value.header_image_url
          : header_image_url // ignore: cast_nullable_to_non_nullable
              as String?,
      song_art_image_url: freezed == song_art_image_url
          ? _value.song_art_image_url
          : song_art_image_url // ignore: cast_nullable_to_non_nullable
              as String?,
      release_date_for_display: freezed == release_date_for_display
          ? _value.release_date_for_display
          : release_date_for_display // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Song implements _Song {
  _$_Song(
      {required this.artist_names,
      required this.title,
      required this.header_image_url,
      required this.song_art_image_url,
      required this.release_date_for_display,
      required this.id});

  factory _$_Song.fromJson(Map<String, dynamic> json) => _$$_SongFromJson(json);

  @override
  final String? artist_names;
//required String? name,
  @override
  final String? title;
  @override
  final String? header_image_url;
  @override
  final String? song_art_image_url;
  @override
  final String? release_date_for_display;
//required String? full_title,
//required String? image_url,
  @override
  final int id;

  @override
  String toString() {
    return 'Song(artist_names: $artist_names, title: $title, header_image_url: $header_image_url, song_art_image_url: $song_art_image_url, release_date_for_display: $release_date_for_display, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Song &&
            (identical(other.artist_names, artist_names) ||
                other.artist_names == artist_names) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.header_image_url, header_image_url) ||
                other.header_image_url == header_image_url) &&
            (identical(other.song_art_image_url, song_art_image_url) ||
                other.song_art_image_url == song_art_image_url) &&
            (identical(
                    other.release_date_for_display, release_date_for_display) ||
                other.release_date_for_display == release_date_for_display) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, artist_names, title,
      header_image_url, song_art_image_url, release_date_for_display, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SongCopyWith<_$_Song> get copyWith =>
      __$$_SongCopyWithImpl<_$_Song>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SongToJson(
      this,
    );
  }
}

abstract class _Song implements Song {
  factory _Song(
      {required final String? artist_names,
      required final String? title,
      required final String? header_image_url,
      required final String? song_art_image_url,
      required final String? release_date_for_display,
      required final int id}) = _$_Song;

  factory _Song.fromJson(Map<String, dynamic> json) = _$_Song.fromJson;

  @override
  String? get artist_names;
  @override //required String? name,
  String? get title;
  @override
  String? get header_image_url;
  @override
  String? get song_art_image_url;
  @override
  String? get release_date_for_display;
  @override //required String? full_title,
//required String? image_url,
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_SongCopyWith<_$_Song> get copyWith => throw _privateConstructorUsedError;
}
