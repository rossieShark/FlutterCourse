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
  @JsonKey(name: 'chart_items')
  List<Artists> get chartItems => throw _privateConstructorUsedError;

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
  $Res call({@JsonKey(name: 'chart_items') List<Artists> chartItems});
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
    Object? chartItems = null,
  }) {
    return _then(_value.copyWith(
      chartItems: null == chartItems
          ? _value.chartItems
          : chartItems // ignore: cast_nullable_to_non_nullable
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
  $Res call({@JsonKey(name: 'chart_items') List<Artists> chartItems});
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
    Object? chartItems = null,
  }) {
    return _then(_$_FavouriteArtistResponse(
      chartItems: null == chartItems
          ? _value._chartItems
          : chartItems // ignore: cast_nullable_to_non_nullable
              as List<Artists>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FavouriteArtistResponse implements _FavouriteArtistResponse {
  _$_FavouriteArtistResponse(
      {@JsonKey(name: 'chart_items') required final List<Artists> chartItems})
      : _chartItems = chartItems;

  factory _$_FavouriteArtistResponse.fromJson(Map<String, dynamic> json) =>
      _$$_FavouriteArtistResponseFromJson(json);

  final List<Artists> _chartItems;
  @override
  @JsonKey(name: 'chart_items')
  List<Artists> get chartItems {
    if (_chartItems is EqualUnmodifiableListView) return _chartItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chartItems);
  }

  @override
  String toString() {
    return 'FavouriteArtistResponse(chartItems: $chartItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavouriteArtistResponse &&
            const DeepCollectionEquality()
                .equals(other._chartItems, _chartItems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_chartItems));

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
  factory _FavouriteArtistResponse(
      {@JsonKey(name: 'chart_items')
      required final List<Artists> chartItems}) = _$_FavouriteArtistResponse;

  factory _FavouriteArtistResponse.fromJson(Map<String, dynamic> json) =
      _$_FavouriteArtistResponse.fromJson;

  @override
  @JsonKey(name: 'chart_items')
  List<Artists> get chartItems;
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
  Item get item => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtistsCopyWith<Artists> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistsCopyWith<$Res> {
  factory $ArtistsCopyWith(Artists value, $Res Function(Artists) then) =
      _$ArtistsCopyWithImpl<$Res, Artists>;
  @useResult
  $Res call({Item item});

  $ItemCopyWith<$Res> get item;
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
    Object? item = null,
  }) {
    return _then(_value.copyWith(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ItemCopyWith<$Res> get item {
    return $ItemCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ArtistsCopyWith<$Res> implements $ArtistsCopyWith<$Res> {
  factory _$$_ArtistsCopyWith(
          _$_Artists value, $Res Function(_$_Artists) then) =
      __$$_ArtistsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Item item});

  @override
  $ItemCopyWith<$Res> get item;
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
    Object? item = null,
  }) {
    return _then(_$_Artists(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Artists implements _Artists {
  _$_Artists({required this.item});

  factory _$_Artists.fromJson(Map<String, dynamic> json) =>
      _$$_ArtistsFromJson(json);

  @override
  final Item item;

  @override
  String toString() {
    return 'Artists(item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Artists &&
            (identical(other.item, item) || other.item == item));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, item);

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
  factory _Artists({required final Item item}) = _$_Artists;

  factory _Artists.fromJson(Map<String, dynamic> json) = _$_Artists.fromJson;

  @override
  Item get item;
  @override
  @JsonKey(ignore: true)
  _$$_ArtistsCopyWith<_$_Artists> get copyWith =>
      throw _privateConstructorUsedError;
}

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res, Item>;
  @useResult
  $Res call(
      {String? name, @JsonKey(name: 'image_url') String? imageUrl, int id});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res, $Val extends Item>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? imageUrl = freezed,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$_ItemCopyWith(_$_Item value, $Res Function(_$_Item) then) =
      __$$_ItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name, @JsonKey(name: 'image_url') String? imageUrl, int id});
}

/// @nodoc
class __$$_ItemCopyWithImpl<$Res> extends _$ItemCopyWithImpl<$Res, _$_Item>
    implements _$$_ItemCopyWith<$Res> {
  __$$_ItemCopyWithImpl(_$_Item _value, $Res Function(_$_Item) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? imageUrl = freezed,
    Object? id = null,
  }) {
    return _then(_$_Item(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
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
class _$_Item implements _Item {
  _$_Item(
      {required this.name,
      @JsonKey(name: 'image_url') required this.imageUrl,
      required this.id});

  factory _$_Item.fromJson(Map<String, dynamic> json) => _$$_ItemFromJson(json);

  @override
  final String? name;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  final int id;

  @override
  String toString() {
    return 'Item(name: $name, imageUrl: $imageUrl, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Item &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, imageUrl, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ItemCopyWith<_$_Item> get copyWith =>
      __$$_ItemCopyWithImpl<_$_Item>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemToJson(
      this,
    );
  }
}

abstract class _Item implements Item {
  factory _Item(
      {required final String? name,
      @JsonKey(name: 'image_url') required final String? imageUrl,
      required final int id}) = _$_Item;

  factory _Item.fromJson(Map<String, dynamic> json) = _$_Item.fromJson;

  @override
  String? get name;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_ItemCopyWith<_$_Item> get copyWith => throw _privateConstructorUsedError;
}
