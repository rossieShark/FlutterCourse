// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favourite_artist_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FavouriteArtistResponse _$FavouriteArtistResponseFromJson(
    Map<String, dynamic> json) {
  return _FavouriteArtistResponse.fromJson(json);
}

/// @nodoc
mixin _$FavouriteArtistResponse {
  List<Artists> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavouriteArtistResponseCopyWith<FavouriteArtistResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouriteArtistResponseCopyWith<$Res> {
  factory $FavouriteArtistResponseCopyWith(FavouriteArtistResponse value,
          $Res Function(FavouriteArtistResponse) then) =
      _$FavouriteArtistResponseCopyWithImpl<$Res, FavouriteArtistResponse>;
  @useResult
  $Res call({List<Artists> data});
}

/// @nodoc
class _$FavouriteArtistResponseCopyWithImpl<$Res,
        $Val extends FavouriteArtistResponse>
    implements $FavouriteArtistResponseCopyWith<$Res> {
  _$FavouriteArtistResponseCopyWithImpl(this._value, this._then);

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
              as List<Artists>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FavouriteArtistResponseCopyWith<$Res>
    implements $FavouriteArtistResponseCopyWith<$Res> {
  factory _$$_FavouriteArtistResponseCopyWith(_$_FavouriteArtistResponse value,
          $Res Function(_$_FavouriteArtistResponse) then) =
      __$$_FavouriteArtistResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Artists> data});
}

/// @nodoc
class __$$_FavouriteArtistResponseCopyWithImpl<$Res>
    extends _$FavouriteArtistResponseCopyWithImpl<$Res,
        _$_FavouriteArtistResponse>
    implements _$$_FavouriteArtistResponseCopyWith<$Res> {
  __$$_FavouriteArtistResponseCopyWithImpl(_$_FavouriteArtistResponse _value,
      $Res Function(_$_FavouriteArtistResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_FavouriteArtistResponse(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Artists>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FavouriteArtistResponse implements _FavouriteArtistResponse {
  _$_FavouriteArtistResponse({required final List<Artists> data})
      : _data = data;

  factory _$_FavouriteArtistResponse.fromJson(Map<String, dynamic> json) =>
      _$$_FavouriteArtistResponseFromJson(json);

  final List<Artists> _data;
  @override
  List<Artists> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'FavouriteArtistResponse(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavouriteArtistResponse &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavouriteArtistResponseCopyWith<_$_FavouriteArtistResponse>
      get copyWith =>
          __$$_FavouriteArtistResponseCopyWithImpl<_$_FavouriteArtistResponse>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FavouriteArtistResponseToJson(
      this,
    );
  }
}

abstract class _FavouriteArtistResponse implements FavouriteArtistResponse {
  factory _FavouriteArtistResponse({required final List<Artists> data}) =
      _$_FavouriteArtistResponse;

  factory _FavouriteArtistResponse.fromJson(Map<String, dynamic> json) =
      _$_FavouriteArtistResponse.fromJson;

  @override
  List<Artists> get data;
  @override
  @JsonKey(ignore: true)
  _$$_FavouriteArtistResponseCopyWith<_$_FavouriteArtistResponse>
      get copyWith => throw _privateConstructorUsedError;
}

Artists _$ArtistsFromJson(Map<String, dynamic> json) {
  return _Artists.fromJson(json);
}

/// @nodoc
mixin _$Artists {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'picture_big')
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtistsCopyWith<Artists> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistsCopyWith<$Res> {
  factory $ArtistsCopyWith(Artists value, $Res Function(Artists) then) =
      _$ArtistsCopyWithImpl<$Res, Artists>;
  @useResult
  $Res call({int id, String name, @JsonKey(name: 'picture_big') String image});
}

/// @nodoc
class _$ArtistsCopyWithImpl<$Res, $Val extends Artists>
    implements $ArtistsCopyWith<$Res> {
  _$ArtistsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$_ArtistsCopyWith<$Res> implements $ArtistsCopyWith<$Res> {
  factory _$$_ArtistsCopyWith(
          _$_Artists value, $Res Function(_$_Artists) then) =
      __$$_ArtistsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, @JsonKey(name: 'picture_big') String image});
}

/// @nodoc
class __$$_ArtistsCopyWithImpl<$Res>
    extends _$ArtistsCopyWithImpl<$Res, _$_Artists>
    implements _$$_ArtistsCopyWith<$Res> {
  __$$_ArtistsCopyWithImpl(_$_Artists _value, $Res Function(_$_Artists) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
  }) {
    return _then(_$_Artists(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$_Artists implements _Artists {
  _$_Artists(
      {required this.id,
      required this.name,
      @JsonKey(name: 'picture_big') required this.image});

  factory _$_Artists.fromJson(Map<String, dynamic> json) =>
      _$$_ArtistsFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'picture_big')
  final String image;

  @override
  String toString() {
    return 'Artists(id: $id, name: $name, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Artists &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArtistsCopyWith<_$_Artists> get copyWith =>
      __$$_ArtistsCopyWithImpl<_$_Artists>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ArtistsToJson(
      this,
    );
  }
}

abstract class _Artists implements Artists {
  factory _Artists(
      {required final int id,
      required final String name,
      @JsonKey(name: 'picture_big') required final String image}) = _$_Artists;

  factory _Artists.fromJson(Map<String, dynamic> json) = _$_Artists.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'picture_big')
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$_ArtistsCopyWith<_$_Artists> get copyWith =>
      throw _privateConstructorUsedError;
}
