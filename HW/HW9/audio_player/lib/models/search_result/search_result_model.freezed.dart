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
  List<Hits> get hits => throw _privateConstructorUsedError;

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
  $Res call({List<Hits> hits});
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
    Object? hits = null,
  }) {
    return _then(_value.copyWith(
      hits: null == hits
          ? _value.hits
          : hits // ignore: cast_nullable_to_non_nullable
              as List<Hits>,
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
  $Res call({List<Hits> hits});
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
    Object? hits = null,
  }) {
    return _then(_$_SearchResultResponce(
      hits: null == hits
          ? _value._hits
          : hits // ignore: cast_nullable_to_non_nullable
              as List<Hits>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchResultResponce implements _SearchResultResponce {
  _$_SearchResultResponce({required final List<Hits> hits}) : _hits = hits;

  factory _$_SearchResultResponce.fromJson(Map<String, dynamic> json) =>
      _$$_SearchResultResponceFromJson(json);

  final List<Hits> _hits;
  @override
  List<Hits> get hits {
    if (_hits is EqualUnmodifiableListView) return _hits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hits);
  }

  @override
  String toString() {
    return 'SearchResultResponce(hits: $hits)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchResultResponce &&
            const DeepCollectionEquality().equals(other._hits, _hits));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_hits));

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
  factory _SearchResultResponce({required final List<Hits> hits}) =
      _$_SearchResultResponce;

  factory _SearchResultResponce.fromJson(Map<String, dynamic> json) =
      _$_SearchResultResponce.fromJson;

  @override
  List<Hits> get hits;
  @override
  @JsonKey(ignore: true)
  _$$_SearchResultResponceCopyWith<_$_SearchResultResponce> get copyWith =>
      throw _privateConstructorUsedError;
}

Hits _$HitsFromJson(Map<String, dynamic> json) {
  return _Hits.fromJson(json);
}

/// @nodoc
mixin _$Hits {
  Result get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HitsCopyWith<Hits> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HitsCopyWith<$Res> {
  factory $HitsCopyWith(Hits value, $Res Function(Hits) then) =
      _$HitsCopyWithImpl<$Res, Hits>;
  @useResult
  $Res call({Result result});

  $ResultCopyWith<$Res> get result;
}

/// @nodoc
class _$HitsCopyWithImpl<$Res, $Val extends Hits>
    implements $HitsCopyWith<$Res> {
  _$HitsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_value.copyWith(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Result,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ResultCopyWith<$Res> get result {
    return $ResultCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_HitsCopyWith<$Res> implements $HitsCopyWith<$Res> {
  factory _$$_HitsCopyWith(_$_Hits value, $Res Function(_$_Hits) then) =
      __$$_HitsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Result result});

  @override
  $ResultCopyWith<$Res> get result;
}

/// @nodoc
class __$$_HitsCopyWithImpl<$Res> extends _$HitsCopyWithImpl<$Res, _$_Hits>
    implements _$$_HitsCopyWith<$Res> {
  __$$_HitsCopyWithImpl(_$_Hits _value, $Res Function(_$_Hits) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$_Hits(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Result,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Hits implements _Hits {
  _$_Hits({required this.result});

  factory _$_Hits.fromJson(Map<String, dynamic> json) => _$$_HitsFromJson(json);

  @override
  final Result result;

  @override
  String toString() {
    return 'Hits(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Hits &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HitsCopyWith<_$_Hits> get copyWith =>
      __$$_HitsCopyWithImpl<_$_Hits>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HitsToJson(
      this,
    );
  }
}

abstract class _Hits implements Hits {
  factory _Hits({required final Result result}) = _$_Hits;

  factory _Hits.fromJson(Map<String, dynamic> json) = _$_Hits.fromJson;

  @override
  Result get result;
  @override
  @JsonKey(ignore: true)
  _$$_HitsCopyWith<_$_Hits> get copyWith => throw _privateConstructorUsedError;
}

Result _$ResultFromJson(Map<String, dynamic> json) {
  return _Result.fromJson(json);
}

/// @nodoc
mixin _$Result {
  String? get artist_names => throw _privateConstructorUsedError;
  String? get header_image_url => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResultCopyWith<Result> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<$Res> {
  factory $ResultCopyWith(Result value, $Res Function(Result) then) =
      _$ResultCopyWithImpl<$Res, Result>;
  @useResult
  $Res call(
      {String? artist_names, String? header_image_url, String? title, int id});
}

/// @nodoc
class _$ResultCopyWithImpl<$Res, $Val extends Result>
    implements $ResultCopyWith<$Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artist_names = freezed,
    Object? header_image_url = freezed,
    Object? title = freezed,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      artist_names: freezed == artist_names
          ? _value.artist_names
          : artist_names // ignore: cast_nullable_to_non_nullable
              as String?,
      header_image_url: freezed == header_image_url
          ? _value.header_image_url
          : header_image_url // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResultCopyWith<$Res> implements $ResultCopyWith<$Res> {
  factory _$$_ResultCopyWith(_$_Result value, $Res Function(_$_Result) then) =
      __$$_ResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? artist_names, String? header_image_url, String? title, int id});
}

/// @nodoc
class __$$_ResultCopyWithImpl<$Res>
    extends _$ResultCopyWithImpl<$Res, _$_Result>
    implements _$$_ResultCopyWith<$Res> {
  __$$_ResultCopyWithImpl(_$_Result _value, $Res Function(_$_Result) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artist_names = freezed,
    Object? header_image_url = freezed,
    Object? title = freezed,
    Object? id = null,
  }) {
    return _then(_$_Result(
      artist_names: freezed == artist_names
          ? _value.artist_names
          : artist_names // ignore: cast_nullable_to_non_nullable
              as String?,
      header_image_url: freezed == header_image_url
          ? _value.header_image_url
          : header_image_url // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
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
class _$_Result implements _Result {
  _$_Result(
      {required this.artist_names,
      required this.header_image_url,
      required this.title,
      required this.id});

  factory _$_Result.fromJson(Map<String, dynamic> json) =>
      _$$_ResultFromJson(json);

  @override
  final String? artist_names;
  @override
  final String? header_image_url;
  @override
  final String? title;
  @override
  final int id;

  @override
  String toString() {
    return 'Result(artist_names: $artist_names, header_image_url: $header_image_url, title: $title, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Result &&
            (identical(other.artist_names, artist_names) ||
                other.artist_names == artist_names) &&
            (identical(other.header_image_url, header_image_url) ||
                other.header_image_url == header_image_url) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, artist_names, header_image_url, title, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResultCopyWith<_$_Result> get copyWith =>
      __$$_ResultCopyWithImpl<_$_Result>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResultToJson(
      this,
    );
  }
}

abstract class _Result implements Result {
  factory _Result(
      {required final String? artist_names,
      required final String? header_image_url,
      required final String? title,
      required final int id}) = _$_Result;

  factory _Result.fromJson(Map<String, dynamic> json) = _$_Result.fromJson;

  @override
  String? get artist_names;
  @override
  String? get header_image_url;
  @override
  String? get title;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_ResultCopyWith<_$_Result> get copyWith =>
      throw _privateConstructorUsedError;
}
