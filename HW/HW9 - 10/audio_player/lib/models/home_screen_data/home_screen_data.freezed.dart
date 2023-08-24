// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_screen_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BestAlbumsResponse _$BestAlbumsResponseFromJson(Map<String, dynamic> json) {
  return _BestAlbumsResponse.fromJson(json);
}

/// @nodoc
mixin _$BestAlbumsResponse {
  @JsonKey(name: 'chart_items')
  List<BestAlbumsList> get chartItems => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BestAlbumsResponseCopyWith<BestAlbumsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BestAlbumsResponseCopyWith<$Res> {
  factory $BestAlbumsResponseCopyWith(
          BestAlbumsResponse value, $Res Function(BestAlbumsResponse) then) =
      _$BestAlbumsResponseCopyWithImpl<$Res, BestAlbumsResponse>;
  @useResult
  $Res call({@JsonKey(name: 'chart_items') List<BestAlbumsList> chartItems});
}

/// @nodoc
class _$BestAlbumsResponseCopyWithImpl<$Res, $Val extends BestAlbumsResponse>
    implements $BestAlbumsResponseCopyWith<$Res> {
  _$BestAlbumsResponseCopyWithImpl(this._value, this._then);

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
              as List<BestAlbumsList>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BestAlbumsResponseCopyWith<$Res>
    implements $BestAlbumsResponseCopyWith<$Res> {
  factory _$$_BestAlbumsResponseCopyWith(_$_BestAlbumsResponse value,
          $Res Function(_$_BestAlbumsResponse) then) =
      __$$_BestAlbumsResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'chart_items') List<BestAlbumsList> chartItems});
}

/// @nodoc
class __$$_BestAlbumsResponseCopyWithImpl<$Res>
    extends _$BestAlbumsResponseCopyWithImpl<$Res, _$_BestAlbumsResponse>
    implements _$$_BestAlbumsResponseCopyWith<$Res> {
  __$$_BestAlbumsResponseCopyWithImpl(
      _$_BestAlbumsResponse _value, $Res Function(_$_BestAlbumsResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chartItems = null,
  }) {
    return _then(_$_BestAlbumsResponse(
      chartItems: null == chartItems
          ? _value._chartItems
          : chartItems // ignore: cast_nullable_to_non_nullable
              as List<BestAlbumsList>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BestAlbumsResponse implements _BestAlbumsResponse {
  _$_BestAlbumsResponse(
      {@JsonKey(name: 'chart_items')
      required final List<BestAlbumsList> chartItems})
      : _chartItems = chartItems;

  factory _$_BestAlbumsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_BestAlbumsResponseFromJson(json);

  final List<BestAlbumsList> _chartItems;
  @override
  @JsonKey(name: 'chart_items')
  List<BestAlbumsList> get chartItems {
    if (_chartItems is EqualUnmodifiableListView) return _chartItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chartItems);
  }

  @override
  String toString() {
    return 'BestAlbumsResponse(chartItems: $chartItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BestAlbumsResponse &&
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
  _$$_BestAlbumsResponseCopyWith<_$_BestAlbumsResponse> get copyWith =>
      __$$_BestAlbumsResponseCopyWithImpl<_$_BestAlbumsResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BestAlbumsResponseToJson(
      this,
    );
  }
}

abstract class _BestAlbumsResponse implements BestAlbumsResponse {
  factory _BestAlbumsResponse(
      {@JsonKey(name: 'chart_items')
      required final List<BestAlbumsList> chartItems}) = _$_BestAlbumsResponse;

  factory _BestAlbumsResponse.fromJson(Map<String, dynamic> json) =
      _$_BestAlbumsResponse.fromJson;

  @override
  @JsonKey(name: 'chart_items')
  List<BestAlbumsList> get chartItems;
  @override
  @JsonKey(ignore: true)
  _$$_BestAlbumsResponseCopyWith<_$_BestAlbumsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

BestAlbumsList _$BestAlbumsListFromJson(Map<String, dynamic> json) {
  return _BestAlbumsList.fromJson(json);
}

/// @nodoc
mixin _$BestAlbumsList {
  Item get item => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BestAlbumsListCopyWith<BestAlbumsList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BestAlbumsListCopyWith<$Res> {
  factory $BestAlbumsListCopyWith(
          BestAlbumsList value, $Res Function(BestAlbumsList) then) =
      _$BestAlbumsListCopyWithImpl<$Res, BestAlbumsList>;
  @useResult
  $Res call({Item item});

  $ItemCopyWith<$Res> get item;
}

/// @nodoc
class _$BestAlbumsListCopyWithImpl<$Res, $Val extends BestAlbumsList>
    implements $BestAlbumsListCopyWith<$Res> {
  _$BestAlbumsListCopyWithImpl(this._value, this._then);

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
abstract class _$$_BestAlbumsListCopyWith<$Res>
    implements $BestAlbumsListCopyWith<$Res> {
  factory _$$_BestAlbumsListCopyWith(
          _$_BestAlbumsList value, $Res Function(_$_BestAlbumsList) then) =
      __$$_BestAlbumsListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Item item});

  @override
  $ItemCopyWith<$Res> get item;
}

/// @nodoc
class __$$_BestAlbumsListCopyWithImpl<$Res>
    extends _$BestAlbumsListCopyWithImpl<$Res, _$_BestAlbumsList>
    implements _$$_BestAlbumsListCopyWith<$Res> {
  __$$_BestAlbumsListCopyWithImpl(
      _$_BestAlbumsList _value, $Res Function(_$_BestAlbumsList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$_BestAlbumsList(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BestAlbumsList implements _BestAlbumsList {
  _$_BestAlbumsList({required this.item});

  factory _$_BestAlbumsList.fromJson(Map<String, dynamic> json) =>
      _$$_BestAlbumsListFromJson(json);

  @override
  final Item item;

  @override
  String toString() {
    return 'BestAlbumsList(item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BestAlbumsList &&
            (identical(other.item, item) || other.item == item));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BestAlbumsListCopyWith<_$_BestAlbumsList> get copyWith =>
      __$$_BestAlbumsListCopyWithImpl<_$_BestAlbumsList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BestAlbumsListToJson(
      this,
    );
  }
}

abstract class _BestAlbumsList implements BestAlbumsList {
  factory _BestAlbumsList({required final Item item}) = _$_BestAlbumsList;

  factory _BestAlbumsList.fromJson(Map<String, dynamic> json) =
      _$_BestAlbumsList.fromJson;

  @override
  Item get item;
  @override
  @JsonKey(ignore: true)
  _$$_BestAlbumsListCopyWith<_$_BestAlbumsList> get copyWith =>
      throw _privateConstructorUsedError;
}

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  @JsonKey(name: 'cover_art_url')
  String? get coverImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_date_for_display')
  String? get releaseDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_title')
  String? get fullTitle => throw _privateConstructorUsedError;
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
      {@JsonKey(name: 'cover_art_url') String? coverImage,
      @JsonKey(name: 'release_date_for_display') String? releaseDate,
      @JsonKey(name: 'full_title') String? fullTitle,
      int id});
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
    Object? coverImage = freezed,
    Object? releaseDate = freezed,
    Object? fullTitle = freezed,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      fullTitle: freezed == fullTitle
          ? _value.fullTitle
          : fullTitle // ignore: cast_nullable_to_non_nullable
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
      {@JsonKey(name: 'cover_art_url') String? coverImage,
      @JsonKey(name: 'release_date_for_display') String? releaseDate,
      @JsonKey(name: 'full_title') String? fullTitle,
      int id});
}

/// @nodoc
class __$$_ItemCopyWithImpl<$Res> extends _$ItemCopyWithImpl<$Res, _$_Item>
    implements _$$_ItemCopyWith<$Res> {
  __$$_ItemCopyWithImpl(_$_Item _value, $Res Function(_$_Item) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coverImage = freezed,
    Object? releaseDate = freezed,
    Object? fullTitle = freezed,
    Object? id = null,
  }) {
    return _then(_$_Item(
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      fullTitle: freezed == fullTitle
          ? _value.fullTitle
          : fullTitle // ignore: cast_nullable_to_non_nullable
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
      {@JsonKey(name: 'cover_art_url') required this.coverImage,
      @JsonKey(name: 'release_date_for_display') required this.releaseDate,
      @JsonKey(name: 'full_title') required this.fullTitle,
      required this.id});

  factory _$_Item.fromJson(Map<String, dynamic> json) => _$$_ItemFromJson(json);

  @override
  @JsonKey(name: 'cover_art_url')
  final String? coverImage;
  @override
  @JsonKey(name: 'release_date_for_display')
  final String? releaseDate;
  @override
  @JsonKey(name: 'full_title')
  final String? fullTitle;
  @override
  final int id;

  @override
  String toString() {
    return 'Item(coverImage: $coverImage, releaseDate: $releaseDate, fullTitle: $fullTitle, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Item &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.fullTitle, fullTitle) ||
                other.fullTitle == fullTitle) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, coverImage, releaseDate, fullTitle, id);

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
      {@JsonKey(name: 'cover_art_url') required final String? coverImage,
      @JsonKey(name: 'release_date_for_display')
      required final String? releaseDate,
      @JsonKey(name: 'full_title') required final String? fullTitle,
      required final int id}) = _$_Item;

  factory _Item.fromJson(Map<String, dynamic> json) = _$_Item.fromJson;

  @override
  @JsonKey(name: 'cover_art_url')
  String? get coverImage;
  @override
  @JsonKey(name: 'release_date_for_display')
  String? get releaseDate;
  @override
  @JsonKey(name: 'full_title')
  String? get fullTitle;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_ItemCopyWith<_$_Item> get copyWith => throw _privateConstructorUsedError;
}
