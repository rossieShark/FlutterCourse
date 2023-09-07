// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchResultResponce _$SearchResultResponceFromJson(Map<String, dynamic> json) {
  return _SearchResultResponce.fromJson(json);
}

/// @nodoc
mixin _$SearchResultResponce {
  List<SearchData> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchResultResponceCopyWith<SearchResultResponce> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchResultResponceCopyWith<$Res> {
  factory $SearchResultResponceCopyWith(SearchResultResponce value,
          $Res Function(SearchResultResponce) then) =
      _$SearchResultResponceCopyWithImpl<$Res, SearchResultResponce>;
  @useResult
  $Res call({List<SearchData> data});
}

/// @nodoc
class _$SearchResultResponceCopyWithImpl<$Res,
        $Val extends SearchResultResponce>
    implements $SearchResultResponceCopyWith<$Res> {
  _$SearchResultResponceCopyWithImpl(this._value, this._then);

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
              as List<SearchData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchResultResponceCopyWith<$Res>
    implements $SearchResultResponceCopyWith<$Res> {
  factory _$$_SearchResultResponceCopyWith(_$_SearchResultResponce value,
          $Res Function(_$_SearchResultResponce) then) =
      __$$_SearchResultResponceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SearchData> data});
}

/// @nodoc
class __$$_SearchResultResponceCopyWithImpl<$Res>
    extends _$SearchResultResponceCopyWithImpl<$Res, _$_SearchResultResponce>
    implements _$$_SearchResultResponceCopyWith<$Res> {
  __$$_SearchResultResponceCopyWithImpl(_$_SearchResultResponce _value,
      $Res Function(_$_SearchResultResponce) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_SearchResultResponce(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SearchData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchResultResponce implements _SearchResultResponce {
  _$_SearchResultResponce({required final List<SearchData> data})
      : _data = data;

  factory _$_SearchResultResponce.fromJson(Map<String, dynamic> json) =>
      _$$_SearchResultResponceFromJson(json);

  final List<SearchData> _data;
  @override
  List<SearchData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'SearchResultResponce(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchResultResponce &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchResultResponceCopyWith<_$_SearchResultResponce> get copyWith =>
      __$$_SearchResultResponceCopyWithImpl<_$_SearchResultResponce>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchResultResponceToJson(
      this,
    );
  }
}

abstract class _SearchResultResponce implements SearchResultResponce {
  factory _SearchResultResponce({required final List<SearchData> data}) =
      _$_SearchResultResponce;

  factory _SearchResultResponce.fromJson(Map<String, dynamic> json) =
      _$_SearchResultResponce.fromJson;

  @override
  List<SearchData> get data;
  @override
  @JsonKey(ignore: true)
  _$$_SearchResultResponceCopyWith<_$_SearchResultResponce> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchData _$SearchDataFromJson(Map<String, dynamic> json) {
  return _SearchData.fromJson(json);
}

/// @nodoc
mixin _$SearchData {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  SearchDataArtist get artist => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchDataCopyWith<SearchData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchDataCopyWith<$Res> {
  factory $SearchDataCopyWith(
          SearchData value, $Res Function(SearchData) then) =
      _$SearchDataCopyWithImpl<$Res, SearchData>;
  @useResult
  $Res call({int id, String title, String type, SearchDataArtist artist});

  $SearchDataArtistCopyWith<$Res> get artist;
}

/// @nodoc
class _$SearchDataCopyWithImpl<$Res, $Val extends SearchData>
    implements $SearchDataCopyWith<$Res> {
  _$SearchDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? artist = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as SearchDataArtist,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SearchDataArtistCopyWith<$Res> get artist {
    return $SearchDataArtistCopyWith<$Res>(_value.artist, (value) {
      return _then(_value.copyWith(artist: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SearchDataCopyWith<$Res>
    implements $SearchDataCopyWith<$Res> {
  factory _$$_SearchDataCopyWith(
          _$_SearchData value, $Res Function(_$_SearchData) then) =
      __$$_SearchDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title, String type, SearchDataArtist artist});

  @override
  $SearchDataArtistCopyWith<$Res> get artist;
}

/// @nodoc
class __$$_SearchDataCopyWithImpl<$Res>
    extends _$SearchDataCopyWithImpl<$Res, _$_SearchData>
    implements _$$_SearchDataCopyWith<$Res> {
  __$$_SearchDataCopyWithImpl(
      _$_SearchData _value, $Res Function(_$_SearchData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? artist = null,
  }) {
    return _then(_$_SearchData(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as SearchDataArtist,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchData implements _SearchData {
  _$_SearchData(
      {required this.id,
      required this.title,
      required this.type,
      required this.artist});

  factory _$_SearchData.fromJson(Map<String, dynamic> json) =>
      _$$_SearchDataFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String type;
  @override
  final SearchDataArtist artist;

  @override
  String toString() {
    return 'SearchData(id: $id, title: $title, type: $type, artist: $artist)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.artist, artist) || other.artist == artist));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, type, artist);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchDataCopyWith<_$_SearchData> get copyWith =>
      __$$_SearchDataCopyWithImpl<_$_SearchData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchDataToJson(
      this,
    );
  }
}

abstract class _SearchData implements SearchData {
  factory _SearchData(
      {required final int id,
      required final String title,
      required final String type,
      required final SearchDataArtist artist}) = _$_SearchData;

  factory _SearchData.fromJson(Map<String, dynamic> json) =
      _$_SearchData.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get type;
  @override
  SearchDataArtist get artist;
  @override
  @JsonKey(ignore: true)
  _$$_SearchDataCopyWith<_$_SearchData> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchDataArtist _$SearchDataArtistFromJson(Map<String, dynamic> json) {
  return _SearchDataArtist.fromJson(json);
}

/// @nodoc
mixin _$SearchDataArtist {
  @JsonKey(name: 'picture_big')
  String get image => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchDataArtistCopyWith<SearchDataArtist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchDataArtistCopyWith<$Res> {
  factory $SearchDataArtistCopyWith(
          SearchDataArtist value, $Res Function(SearchDataArtist) then) =
      _$SearchDataArtistCopyWithImpl<$Res, SearchDataArtist>;
  @useResult
  $Res call({@JsonKey(name: 'picture_big') String image, String name});
}

/// @nodoc
class _$SearchDataArtistCopyWithImpl<$Res, $Val extends SearchDataArtist>
    implements $SearchDataArtistCopyWith<$Res> {
  _$SearchDataArtistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchDataArtistCopyWith<$Res>
    implements $SearchDataArtistCopyWith<$Res> {
  factory _$$_SearchDataArtistCopyWith(
          _$_SearchDataArtist value, $Res Function(_$_SearchDataArtist) then) =
      __$$_SearchDataArtistCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'picture_big') String image, String name});
}

/// @nodoc
class __$$_SearchDataArtistCopyWithImpl<$Res>
    extends _$SearchDataArtistCopyWithImpl<$Res, _$_SearchDataArtist>
    implements _$$_SearchDataArtistCopyWith<$Res> {
  __$$_SearchDataArtistCopyWithImpl(
      _$_SearchDataArtist _value, $Res Function(_$_SearchDataArtist) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? name = null,
  }) {
    return _then(_$_SearchDataArtist(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchDataArtist implements _SearchDataArtist {
  _$_SearchDataArtist(
      {@JsonKey(name: 'picture_big') required this.image, required this.name});

  factory _$_SearchDataArtist.fromJson(Map<String, dynamic> json) =>
      _$$_SearchDataArtistFromJson(json);

  @override
  @JsonKey(name: 'picture_big')
  final String image;
  @override
  final String name;

  @override
  String toString() {
    return 'SearchDataArtist(image: $image, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchDataArtist &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, image, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchDataArtistCopyWith<_$_SearchDataArtist> get copyWith =>
      __$$_SearchDataArtistCopyWithImpl<_$_SearchDataArtist>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchDataArtistToJson(
      this,
    );
  }
}

abstract class _SearchDataArtist implements SearchDataArtist {
  factory _SearchDataArtist(
      {@JsonKey(name: 'picture_big') required final String image,
      required final String name}) = _$_SearchDataArtist;

  factory _SearchDataArtist.fromJson(Map<String, dynamic> json) =
      _$_SearchDataArtist.fromJson;

  @override
  @JsonKey(name: 'picture_big')
  String get image;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_SearchDataArtistCopyWith<_$_SearchDataArtist> get copyWith =>
      throw _privateConstructorUsedError;
}
