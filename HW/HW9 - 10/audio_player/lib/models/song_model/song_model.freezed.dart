// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'song_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SongDetailsResponce _$SongDetailsResponceFromJson(Map<String, dynamic> json) {
  return _SongDetailsResponce.fromJson(json);
}

/// @nodoc
mixin _$SongDetailsResponce {
  SongDetail get song => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SongDetailsResponceCopyWith<SongDetailsResponce> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongDetailsResponceCopyWith<$Res> {
  factory $SongDetailsResponceCopyWith(
          SongDetailsResponce value, $Res Function(SongDetailsResponce) then) =
      _$SongDetailsResponceCopyWithImpl<$Res, SongDetailsResponce>;
  @useResult
  $Res call({SongDetail song});

  $SongDetailCopyWith<$Res> get song;
}

/// @nodoc
class _$SongDetailsResponceCopyWithImpl<$Res, $Val extends SongDetailsResponce>
    implements $SongDetailsResponceCopyWith<$Res> {
  _$SongDetailsResponceCopyWithImpl(this._value, this._then);

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
              as SongDetail,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SongDetailCopyWith<$Res> get song {
    return $SongDetailCopyWith<$Res>(_value.song, (value) {
      return _then(_value.copyWith(song: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SongDetailsResponceCopyWith<$Res>
    implements $SongDetailsResponceCopyWith<$Res> {
  factory _$$_SongDetailsResponceCopyWith(_$_SongDetailsResponce value,
          $Res Function(_$_SongDetailsResponce) then) =
      __$$_SongDetailsResponceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SongDetail song});

  @override
  $SongDetailCopyWith<$Res> get song;
}

/// @nodoc
class __$$_SongDetailsResponceCopyWithImpl<$Res>
    extends _$SongDetailsResponceCopyWithImpl<$Res, _$_SongDetailsResponce>
    implements _$$_SongDetailsResponceCopyWith<$Res> {
  __$$_SongDetailsResponceCopyWithImpl(_$_SongDetailsResponce _value,
      $Res Function(_$_SongDetailsResponce) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? song = null,
  }) {
    return _then(_$_SongDetailsResponce(
      song: null == song
          ? _value.song
          : song // ignore: cast_nullable_to_non_nullable
              as SongDetail,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SongDetailsResponce implements _SongDetailsResponce {
  _$_SongDetailsResponce({required this.song});

  factory _$_SongDetailsResponce.fromJson(Map<String, dynamic> json) =>
      _$$_SongDetailsResponceFromJson(json);

  @override
  final SongDetail song;

  @override
  String toString() {
    return 'SongDetailsResponce(song: $song)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SongDetailsResponce &&
            (identical(other.song, song) || other.song == song));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, song);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SongDetailsResponceCopyWith<_$_SongDetailsResponce> get copyWith =>
      __$$_SongDetailsResponceCopyWithImpl<_$_SongDetailsResponce>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SongDetailsResponceToJson(
      this,
    );
  }
}

abstract class _SongDetailsResponce implements SongDetailsResponce {
  factory _SongDetailsResponce({required final SongDetail song}) =
      _$_SongDetailsResponce;

  factory _SongDetailsResponce.fromJson(Map<String, dynamic> json) =
      _$_SongDetailsResponce.fromJson;

  @override
  SongDetail get song;
  @override
  @JsonKey(ignore: true)
  _$$_SongDetailsResponceCopyWith<_$_SongDetailsResponce> get copyWith =>
      throw _privateConstructorUsedError;
}

SongDetail _$SongDetailFromJson(Map<String, dynamic> json) {
  return _SongDetail.fromJson(json);
}

/// @nodoc
mixin _$SongDetail {
  @JsonKey(name: 'artist_names')
  String? get artistNames => throw _privateConstructorUsedError;
  @JsonKey(name: 'header_image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SongDetailCopyWith<SongDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongDetailCopyWith<$Res> {
  factory $SongDetailCopyWith(
          SongDetail value, $Res Function(SongDetail) then) =
      _$SongDetailCopyWithImpl<$Res, SongDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'artist_names') String? artistNames,
      @JsonKey(name: 'header_image_url') String? imageUrl,
      String? title});
}

/// @nodoc
class _$SongDetailCopyWithImpl<$Res, $Val extends SongDetail>
    implements $SongDetailCopyWith<$Res> {
  _$SongDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artistNames = freezed,
    Object? imageUrl = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      artistNames: freezed == artistNames
          ? _value.artistNames
          : artistNames // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SongDetailCopyWith<$Res>
    implements $SongDetailCopyWith<$Res> {
  factory _$$_SongDetailCopyWith(
          _$_SongDetail value, $Res Function(_$_SongDetail) then) =
      __$$_SongDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'artist_names') String? artistNames,
      @JsonKey(name: 'header_image_url') String? imageUrl,
      String? title});
}

/// @nodoc
class __$$_SongDetailCopyWithImpl<$Res>
    extends _$SongDetailCopyWithImpl<$Res, _$_SongDetail>
    implements _$$_SongDetailCopyWith<$Res> {
  __$$_SongDetailCopyWithImpl(
      _$_SongDetail _value, $Res Function(_$_SongDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artistNames = freezed,
    Object? imageUrl = freezed,
    Object? title = freezed,
  }) {
    return _then(_$_SongDetail(
      artistNames: freezed == artistNames
          ? _value.artistNames
          : artistNames // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SongDetail implements _SongDetail {
  _$_SongDetail(
      {@JsonKey(name: 'artist_names') required this.artistNames,
      @JsonKey(name: 'header_image_url') required this.imageUrl,
      required this.title});

  factory _$_SongDetail.fromJson(Map<String, dynamic> json) =>
      _$$_SongDetailFromJson(json);

  @override
  @JsonKey(name: 'artist_names')
  final String? artistNames;
  @override
  @JsonKey(name: 'header_image_url')
  final String? imageUrl;
  @override
  final String? title;

  @override
  String toString() {
    return 'SongDetail(artistNames: $artistNames, imageUrl: $imageUrl, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SongDetail &&
            (identical(other.artistNames, artistNames) ||
                other.artistNames == artistNames) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, artistNames, imageUrl, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SongDetailCopyWith<_$_SongDetail> get copyWith =>
      __$$_SongDetailCopyWithImpl<_$_SongDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SongDetailToJson(
      this,
    );
  }
}

abstract class _SongDetail implements SongDetail {
  factory _SongDetail(
      {@JsonKey(name: 'artist_names') required final String? artistNames,
      @JsonKey(name: 'header_image_url') required final String? imageUrl,
      required final String? title}) = _$_SongDetail;

  factory _SongDetail.fromJson(Map<String, dynamic> json) =
      _$_SongDetail.fromJson;

  @override
  @JsonKey(name: 'artist_names')
  String? get artistNames;
  @override
  @JsonKey(name: 'header_image_url')
  String? get imageUrl;
  @override
  String? get title;
  @override
  @JsonKey(ignore: true)
  _$$_SongDetailCopyWith<_$_SongDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
