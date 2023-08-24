// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_album_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AlbumDetailsResponse _$AlbumDetailsResponseFromJson(Map<String, dynamic> json) {
  return _AlbumDetailsResponce.fromJson(json);
}

/// @nodoc
mixin _$AlbumDetailsResponse {
  @JsonKey(name: 'album_appearances')
  List<AlbumAppearances> get albumAppearances =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlbumDetailsResponseCopyWith<AlbumDetailsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumDetailsResponseCopyWith<$Res> {
  factory $AlbumDetailsResponseCopyWith(AlbumDetailsResponse value,
          $Res Function(AlbumDetailsResponse) then) =
      _$AlbumDetailsResponseCopyWithImpl<$Res, AlbumDetailsResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'album_appearances')
      List<AlbumAppearances> albumAppearances});
}

/// @nodoc
class _$AlbumDetailsResponseCopyWithImpl<$Res,
        $Val extends AlbumDetailsResponse>
    implements $AlbumDetailsResponseCopyWith<$Res> {
  _$AlbumDetailsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? albumAppearances = null,
  }) {
    return _then(_value.copyWith(
      albumAppearances: null == albumAppearances
          ? _value.albumAppearances
          : albumAppearances // ignore: cast_nullable_to_non_nullable
              as List<AlbumAppearances>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AlbumDetailsResponceCopyWith<$Res>
    implements $AlbumDetailsResponseCopyWith<$Res> {
  factory _$$_AlbumDetailsResponceCopyWith(_$_AlbumDetailsResponce value,
          $Res Function(_$_AlbumDetailsResponce) then) =
      __$$_AlbumDetailsResponceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'album_appearances')
      List<AlbumAppearances> albumAppearances});
}

/// @nodoc
class __$$_AlbumDetailsResponceCopyWithImpl<$Res>
    extends _$AlbumDetailsResponseCopyWithImpl<$Res, _$_AlbumDetailsResponce>
    implements _$$_AlbumDetailsResponceCopyWith<$Res> {
  __$$_AlbumDetailsResponceCopyWithImpl(_$_AlbumDetailsResponce _value,
      $Res Function(_$_AlbumDetailsResponce) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? albumAppearances = null,
  }) {
    return _then(_$_AlbumDetailsResponce(
      albumAppearances: null == albumAppearances
          ? _value._albumAppearances
          : albumAppearances // ignore: cast_nullable_to_non_nullable
              as List<AlbumAppearances>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AlbumDetailsResponce implements _AlbumDetailsResponce {
  _$_AlbumDetailsResponce(
      {@JsonKey(name: 'album_appearances')
      required final List<AlbumAppearances> albumAppearances})
      : _albumAppearances = albumAppearances;

  factory _$_AlbumDetailsResponce.fromJson(Map<String, dynamic> json) =>
      _$$_AlbumDetailsResponceFromJson(json);

  final List<AlbumAppearances> _albumAppearances;
  @override
  @JsonKey(name: 'album_appearances')
  List<AlbumAppearances> get albumAppearances {
    if (_albumAppearances is EqualUnmodifiableListView)
      return _albumAppearances;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_albumAppearances);
  }

  @override
  String toString() {
    return 'AlbumDetailsResponse(albumAppearances: $albumAppearances)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AlbumDetailsResponce &&
            const DeepCollectionEquality()
                .equals(other._albumAppearances, _albumAppearances));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_albumAppearances));

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

abstract class _AlbumDetailsResponce implements AlbumDetailsResponse {
  factory _AlbumDetailsResponce(
          {@JsonKey(name: 'album_appearances')
          required final List<AlbumAppearances> albumAppearances}) =
      _$_AlbumDetailsResponce;

  factory _AlbumDetailsResponce.fromJson(Map<String, dynamic> json) =
      _$_AlbumDetailsResponce.fromJson;

  @override
  @JsonKey(name: 'album_appearances')
  List<AlbumAppearances> get albumAppearances;
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
  @JsonKey(name: 'artist_names')
  String? get artistNames => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'header_image_url')
  String? get headerImageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'song_art_image_url')
  String? get songImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_date_for_display')
  String? get releaseDate => throw _privateConstructorUsedError;
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
      {@JsonKey(name: 'artist_names') String? artistNames,
      String? title,
      @JsonKey(name: 'header_image_url') String? headerImageUrl,
      @JsonKey(name: 'song_art_image_url') String? songImage,
      @JsonKey(name: 'release_date_for_display') String? releaseDate,
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
    Object? artistNames = freezed,
    Object? title = freezed,
    Object? headerImageUrl = freezed,
    Object? songImage = freezed,
    Object? releaseDate = freezed,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      artistNames: freezed == artistNames
          ? _value.artistNames
          : artistNames // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      headerImageUrl: freezed == headerImageUrl
          ? _value.headerImageUrl
          : headerImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      songImage: freezed == songImage
          ? _value.songImage
          : songImage // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
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
      {@JsonKey(name: 'artist_names') String? artistNames,
      String? title,
      @JsonKey(name: 'header_image_url') String? headerImageUrl,
      @JsonKey(name: 'song_art_image_url') String? songImage,
      @JsonKey(name: 'release_date_for_display') String? releaseDate,
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
    Object? artistNames = freezed,
    Object? title = freezed,
    Object? headerImageUrl = freezed,
    Object? songImage = freezed,
    Object? releaseDate = freezed,
    Object? id = null,
  }) {
    return _then(_$_Song(
      artistNames: freezed == artistNames
          ? _value.artistNames
          : artistNames // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      headerImageUrl: freezed == headerImageUrl
          ? _value.headerImageUrl
          : headerImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      songImage: freezed == songImage
          ? _value.songImage
          : songImage // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
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
      {@JsonKey(name: 'artist_names') required this.artistNames,
      required this.title,
      @JsonKey(name: 'header_image_url') required this.headerImageUrl,
      @JsonKey(name: 'song_art_image_url') required this.songImage,
      @JsonKey(name: 'release_date_for_display') required this.releaseDate,
      required this.id});

  factory _$_Song.fromJson(Map<String, dynamic> json) => _$$_SongFromJson(json);

  @override
  @JsonKey(name: 'artist_names')
  final String? artistNames;
  @override
  final String? title;
  @override
  @JsonKey(name: 'header_image_url')
  final String? headerImageUrl;
  @override
  @JsonKey(name: 'song_art_image_url')
  final String? songImage;
  @override
  @JsonKey(name: 'release_date_for_display')
  final String? releaseDate;
  @override
  final int id;

  @override
  String toString() {
    return 'Song(artistNames: $artistNames, title: $title, headerImageUrl: $headerImageUrl, songImage: $songImage, releaseDate: $releaseDate, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Song &&
            (identical(other.artistNames, artistNames) ||
                other.artistNames == artistNames) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.headerImageUrl, headerImageUrl) ||
                other.headerImageUrl == headerImageUrl) &&
            (identical(other.songImage, songImage) ||
                other.songImage == songImage) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, artistNames, title,
      headerImageUrl, songImage, releaseDate, id);

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
      {@JsonKey(name: 'artist_names') required final String? artistNames,
      required final String? title,
      @JsonKey(name: 'header_image_url') required final String? headerImageUrl,
      @JsonKey(name: 'song_art_image_url') required final String? songImage,
      @JsonKey(name: 'release_date_for_display')
      required final String? releaseDate,
      required final int id}) = _$_Song;

  factory _Song.fromJson(Map<String, dynamic> json) = _$_Song.fromJson;

  @override
  @JsonKey(name: 'artist_names')
  String? get artistNames;
  @override
  String? get title;
  @override
  @JsonKey(name: 'header_image_url')
  String? get headerImageUrl;
  @override
  @JsonKey(name: 'song_art_image_url')
  String? get songImage;
  @override
  @JsonKey(name: 'release_date_for_display')
  String? get releaseDate;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_SongCopyWith<_$_Song> get copyWith => throw _privateConstructorUsedError;
}
