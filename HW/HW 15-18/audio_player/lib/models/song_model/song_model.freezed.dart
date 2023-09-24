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
  List<Artist> get contributors => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get preview => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

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
  $Res call(
      {List<Artist> contributors, String title, String preview, String type});
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
    Object? contributors = null,
    Object? title = null,
    Object? preview = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      contributors: null == contributors
          ? _value.contributors
          : contributors // ignore: cast_nullable_to_non_nullable
              as List<Artist>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
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
}

/// @nodoc
abstract class _$$_SongDetailsResponceCopyWith<$Res>
    implements $SongDetailsResponceCopyWith<$Res> {
  factory _$$_SongDetailsResponceCopyWith(_$_SongDetailsResponce value,
          $Res Function(_$_SongDetailsResponce) then) =
      __$$_SongDetailsResponceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Artist> contributors, String title, String preview, String type});
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
    Object? contributors = null,
    Object? title = null,
    Object? preview = null,
    Object? type = null,
  }) {
    return _then(_$_SongDetailsResponce(
      contributors: null == contributors
          ? _value._contributors
          : contributors // ignore: cast_nullable_to_non_nullable
              as List<Artist>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$_SongDetailsResponce implements _SongDetailsResponce {
  _$_SongDetailsResponce(
      {required final List<Artist> contributors,
      required this.title,
      required this.preview,
      required this.type})
      : _contributors = contributors;

  factory _$_SongDetailsResponce.fromJson(Map<String, dynamic> json) =>
      _$$_SongDetailsResponceFromJson(json);

  final List<Artist> _contributors;
  @override
  List<Artist> get contributors {
    if (_contributors is EqualUnmodifiableListView) return _contributors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contributors);
  }

  @override
  final String title;
  @override
  final String preview;
  @override
  final String type;

  @override
  String toString() {
    return 'SongDetailsResponce(contributors: $contributors, title: $title, preview: $preview, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SongDetailsResponce &&
            const DeepCollectionEquality()
                .equals(other._contributors, _contributors) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.preview, preview) || other.preview == preview) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_contributors), title, preview, type);

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
  factory _SongDetailsResponce(
      {required final List<Artist> contributors,
      required final String title,
      required final String preview,
      required final String type}) = _$_SongDetailsResponce;

  factory _SongDetailsResponce.fromJson(Map<String, dynamic> json) =
      _$_SongDetailsResponce.fromJson;

  @override
  List<Artist> get contributors;
  @override
  String get title;
  @override
  String get preview;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$_SongDetailsResponceCopyWith<_$_SongDetailsResponce> get copyWith =>
      throw _privateConstructorUsedError;
}

Artist _$ArtistFromJson(Map<String, dynamic> json) {
  return _Artist.fromJson(json);
}

/// @nodoc
mixin _$Artist {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'picture_big')
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtistCopyWith<Artist> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistCopyWith<$Res> {
  factory $ArtistCopyWith(Artist value, $Res Function(Artist) then) =
      _$ArtistCopyWithImpl<$Res, Artist>;
  @useResult
  $Res call({String name, @JsonKey(name: 'picture_big') String image});
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ArtistCopyWith<$Res> implements $ArtistCopyWith<$Res> {
  factory _$$_ArtistCopyWith(_$_Artist value, $Res Function(_$_Artist) then) =
      __$$_ArtistCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, @JsonKey(name: 'picture_big') String image});
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Artist implements _Artist {
  _$_Artist(
      {required this.name, @JsonKey(name: 'picture_big') required this.image});

  factory _$_Artist.fromJson(Map<String, dynamic> json) =>
      _$$_ArtistFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'picture_big')
  final String image;

  @override
  String toString() {
    return 'Artist(name: $name, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Artist &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, image);

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
      @JsonKey(name: 'picture_big') required final String image}) = _$_Artist;

  factory _Artist.fromJson(Map<String, dynamic> json) = _$_Artist.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'picture_big')
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$_ArtistCopyWith<_$_Artist> get copyWith =>
      throw _privateConstructorUsedError;
}
