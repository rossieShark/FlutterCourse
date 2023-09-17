// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recently_played_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecentlyPlayedResponse _$RecentlyPlayedResponseFromJson(
    Map<String, dynamic> json) {
  return _RecentlyPlayedResponse.fromJson(json);
}

/// @nodoc
mixin _$RecentlyPlayedResponse {
  Tracks get tracks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecentlyPlayedResponseCopyWith<RecentlyPlayedResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentlyPlayedResponseCopyWith<$Res> {
  factory $RecentlyPlayedResponseCopyWith(RecentlyPlayedResponse value,
          $Res Function(RecentlyPlayedResponse) then) =
      _$RecentlyPlayedResponseCopyWithImpl<$Res, RecentlyPlayedResponse>;
  @useResult
  $Res call({Tracks tracks});

  $TracksCopyWith<$Res> get tracks;
}

/// @nodoc
class _$RecentlyPlayedResponseCopyWithImpl<$Res,
        $Val extends RecentlyPlayedResponse>
    implements $RecentlyPlayedResponseCopyWith<$Res> {
  _$RecentlyPlayedResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tracks = null,
  }) {
    return _then(_value.copyWith(
      tracks: null == tracks
          ? _value.tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as Tracks,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TracksCopyWith<$Res> get tracks {
    return $TracksCopyWith<$Res>(_value.tracks, (value) {
      return _then(_value.copyWith(tracks: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RecentlyPlayedResponseCopyWith<$Res>
    implements $RecentlyPlayedResponseCopyWith<$Res> {
  factory _$$_RecentlyPlayedResponseCopyWith(_$_RecentlyPlayedResponse value,
          $Res Function(_$_RecentlyPlayedResponse) then) =
      __$$_RecentlyPlayedResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Tracks tracks});

  @override
  $TracksCopyWith<$Res> get tracks;
}

/// @nodoc
class __$$_RecentlyPlayedResponseCopyWithImpl<$Res>
    extends _$RecentlyPlayedResponseCopyWithImpl<$Res,
        _$_RecentlyPlayedResponse>
    implements _$$_RecentlyPlayedResponseCopyWith<$Res> {
  __$$_RecentlyPlayedResponseCopyWithImpl(_$_RecentlyPlayedResponse _value,
      $Res Function(_$_RecentlyPlayedResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tracks = null,
  }) {
    return _then(_$_RecentlyPlayedResponse(
      tracks: null == tracks
          ? _value.tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as Tracks,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecentlyPlayedResponse implements _RecentlyPlayedResponse {
  _$_RecentlyPlayedResponse({required this.tracks});

  factory _$_RecentlyPlayedResponse.fromJson(Map<String, dynamic> json) =>
      _$$_RecentlyPlayedResponseFromJson(json);

  @override
  final Tracks tracks;

  @override
  String toString() {
    return 'RecentlyPlayedResponse(tracks: $tracks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecentlyPlayedResponse &&
            (identical(other.tracks, tracks) || other.tracks == tracks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, tracks);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecentlyPlayedResponseCopyWith<_$_RecentlyPlayedResponse> get copyWith =>
      __$$_RecentlyPlayedResponseCopyWithImpl<_$_RecentlyPlayedResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecentlyPlayedResponseToJson(
      this,
    );
  }
}

abstract class _RecentlyPlayedResponse implements RecentlyPlayedResponse {
  factory _RecentlyPlayedResponse({required final Tracks tracks}) =
      _$_RecentlyPlayedResponse;

  factory _RecentlyPlayedResponse.fromJson(Map<String, dynamic> json) =
      _$_RecentlyPlayedResponse.fromJson;

  @override
  Tracks get tracks;
  @override
  @JsonKey(ignore: true)
  _$$_RecentlyPlayedResponseCopyWith<_$_RecentlyPlayedResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

Tracks _$TracksFromJson(Map<String, dynamic> json) {
  return _Tracks.fromJson(json);
}

/// @nodoc
mixin _$Tracks {
  List<Data> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TracksCopyWith<Tracks> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TracksCopyWith<$Res> {
  factory $TracksCopyWith(Tracks value, $Res Function(Tracks) then) =
      _$TracksCopyWithImpl<$Res, Tracks>;
  @useResult
  $Res call({List<Data> data});
}

/// @nodoc
class _$TracksCopyWithImpl<$Res, $Val extends Tracks>
    implements $TracksCopyWith<$Res> {
  _$TracksCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Data>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TracksCopyWith<$Res> implements $TracksCopyWith<$Res> {
  factory _$$_TracksCopyWith(_$_Tracks value, $Res Function(_$_Tracks) then) =
      __$$_TracksCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Data> data});
}

/// @nodoc
class __$$_TracksCopyWithImpl<$Res>
    extends _$TracksCopyWithImpl<$Res, _$_Tracks>
    implements _$$_TracksCopyWith<$Res> {
  __$$_TracksCopyWithImpl(_$_Tracks _value, $Res Function(_$_Tracks) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_Tracks(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Data>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Tracks implements _Tracks {
  _$_Tracks({required final List<Data> data}) : _data = data;

  factory _$_Tracks.fromJson(Map<String, dynamic> json) =>
      _$$_TracksFromJson(json);

  final List<Data> _data;
  @override
  List<Data> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'Tracks(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Tracks &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TracksCopyWith<_$_Tracks> get copyWith =>
      __$$_TracksCopyWithImpl<_$_Tracks>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TracksToJson(
      this,
    );
  }
}

abstract class _Tracks implements Tracks {
  factory _Tracks({required final List<Data> data}) = _$_Tracks;

  factory _Tracks.fromJson(Map<String, dynamic> json) = _$_Tracks.fromJson;

  @override
  List<Data> get data;
  @override
  @JsonKey(ignore: true)
  _$$_TracksCopyWith<_$_Tracks> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  String get title => throw _privateConstructorUsedError;
  Artist get artist => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get preview => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call({String title, Artist artist, int id, String preview, String type});

  $ArtistCopyWith<$Res> get artist;
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? artist = null,
    Object? id = null,
    Object? preview = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as Artist,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      preview: null == preview
          ? _value.preview
          : preview // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ArtistCopyWith<$Res> get artist {
    return $ArtistCopyWith<$Res>(_value.artist, (value) {
      return _then(_value.copyWith(artist: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DataCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$_DataCopyWith(_$_Data value, $Res Function(_$_Data) then) =
      __$$_DataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, Artist artist, int id, String preview, String type});

  @override
  $ArtistCopyWith<$Res> get artist;
}

/// @nodoc
class __$$_DataCopyWithImpl<$Res> extends _$DataCopyWithImpl<$Res, _$_Data>
    implements _$$_DataCopyWith<$Res> {
  __$$_DataCopyWithImpl(_$_Data _value, $Res Function(_$_Data) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? artist = null,
    Object? id = null,
    Object? preview = null,
    Object? type = null,
  }) {
    return _then(_$_Data(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as Artist,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      preview: null == preview
          ? _value.preview
          : preview // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Data implements _Data {
  _$_Data(
      {required this.title,
      required this.artist,
      required this.id,
      required this.preview,
      required this.type});

  factory _$_Data.fromJson(Map<String, dynamic> json) => _$$_DataFromJson(json);

  @override
  final String title;
  @override
  final Artist artist;
  @override
  final int id;
  @override
  final String preview;
  @override
  final String type;

  @override
  String toString() {
    return 'Data(title: $title, artist: $artist, id: $id, preview: $preview, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Data &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.artist, artist) || other.artist == artist) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.preview, preview) || other.preview == preview) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, artist, id, preview, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataCopyWith<_$_Data> get copyWith =>
      __$$_DataCopyWithImpl<_$_Data>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataToJson(
      this,
    );
  }
}

abstract class _Data implements Data {
  factory _Data(
      {required final String title,
      required final Artist artist,
      required final int id,
      required final String preview,
      required final String type}) = _$_Data;

  factory _Data.fromJson(Map<String, dynamic> json) = _$_Data.fromJson;

  @override
  String get title;
  @override
  Artist get artist;
  @override
  int get id;
  @override
  String get preview;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$_DataCopyWith<_$_Data> get copyWith => throw _privateConstructorUsedError;
}

Artist _$ArtistFromJson(Map<String, dynamic> json) {
  return _Artist.fromJson(json);
}

/// @nodoc
mixin _$Artist {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'picture_big')
  String get image => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtistCopyWith<Artist> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistCopyWith<$Res> {
  factory $ArtistCopyWith(Artist value, $Res Function(Artist) then) =
      _$ArtistCopyWithImpl<$Res, Artist>;
  @useResult
  $Res call({String name, @JsonKey(name: 'picture_big') String image, int id});
}

/// @nodoc
class _$ArtistCopyWithImpl<$Res, $Val extends Artist>
    implements $ArtistCopyWith<$Res> {
  _$ArtistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? image = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ArtistCopyWith<$Res> implements $ArtistCopyWith<$Res> {
  factory _$$_ArtistCopyWith(_$_Artist value, $Res Function(_$_Artist) then) =
      __$$_ArtistCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, @JsonKey(name: 'picture_big') String image, int id});
}

/// @nodoc
class __$$_ArtistCopyWithImpl<$Res>
    extends _$ArtistCopyWithImpl<$Res, _$_Artist>
    implements _$$_ArtistCopyWith<$Res> {
  __$$_ArtistCopyWithImpl(_$_Artist _value, $Res Function(_$_Artist) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? image = null,
    Object? id = null,
  }) {
    return _then(_$_Artist(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Artist implements _Artist {
  _$_Artist(
      {required this.name,
      @JsonKey(name: 'picture_big') required this.image,
      required this.id});

  factory _$_Artist.fromJson(Map<String, dynamic> json) =>
      _$$_ArtistFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'picture_big')
  final String image;
  @override
  final int id;

  @override
  String toString() {
    return 'Artist(name: $name, image: $image, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Artist &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, image, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArtistCopyWith<_$_Artist> get copyWith =>
      __$$_ArtistCopyWithImpl<_$_Artist>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ArtistToJson(
      this,
    );
  }
}

abstract class _Artist implements Artist {
  factory _Artist(
      {required final String name,
      @JsonKey(name: 'picture_big') required final String image,
      required final int id}) = _$_Artist;

  factory _Artist.fromJson(Map<String, dynamic> json) = _$_Artist.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'picture_big')
  String get image;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_ArtistCopyWith<_$_Artist> get copyWith =>
      throw _privateConstructorUsedError;
}
