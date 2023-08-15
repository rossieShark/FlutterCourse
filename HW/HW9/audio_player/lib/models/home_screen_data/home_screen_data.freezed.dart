// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, duplicate_ignore
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_screen_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TracksResponce _$TracksResponceFromJson(Map<String, dynamic> json) {
  return _TracksResponce.fromJson(json);
}

/// @nodoc
mixin _$TracksResponce {
  List<ChartItems> get chart_items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TracksResponceCopyWith<TracksResponce> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TracksResponceCopyWith<$Res> {
  factory $TracksResponceCopyWith(
          TracksResponce value, $Res Function(TracksResponce) then) =
      _$TracksResponceCopyWithImpl<$Res, TracksResponce>;
  @useResult
  $Res call({List<ChartItems> chart_items});
}

/// @nodoc
class _$TracksResponceCopyWithImpl<$Res, $Val extends TracksResponce>
    implements $TracksResponceCopyWith<$Res> {
  _$TracksResponceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chart_items = null,
  }) {
    return _then(_value.copyWith(
      chart_items: null == chart_items
          ? _value.chart_items
          : chart_items // ignore: cast_nullable_to_non_nullable
              as List<ChartItems>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TracksResponceCopyWith<$Res>
    implements $TracksResponceCopyWith<$Res> {
  factory _$$_TracksResponceCopyWith(
          _$_TracksResponce value, $Res Function(_$_TracksResponce) then) =
      __$$_TracksResponceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ChartItems> chart_items});
}

/// @nodoc
class __$$_TracksResponceCopyWithImpl<$Res>
    extends _$TracksResponceCopyWithImpl<$Res, _$_TracksResponce>
    implements _$$_TracksResponceCopyWith<$Res> {
  __$$_TracksResponceCopyWithImpl(
      _$_TracksResponce _value, $Res Function(_$_TracksResponce) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chart_items = null,
  }) {
    return _then(_$_TracksResponce(
      chart_items: null == chart_items
          ? _value._chart_items
          : chart_items // ignore: cast_nullable_to_non_nullable
              as List<ChartItems>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TracksResponce implements _TracksResponce {
  _$_TracksResponce({required final List<ChartItems> chart_items})
      : _chart_items = chart_items;

  factory _$_TracksResponce.fromJson(Map<String, dynamic> json) =>
      _$$_TracksResponceFromJson(json);

  final List<ChartItems> _chart_items;

  @override
  List<ChartItems> get chart_items {
    if (_chart_items is EqualUnmodifiableListView) return _chart_items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chart_items);
  }

  @override
  String toString() {
    return 'TracksResponce(chart_items: $chart_items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TracksResponce &&
            const DeepCollectionEquality()
                .equals(other._chart_items, _chart_items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_chart_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TracksResponceCopyWith<_$_TracksResponce> get copyWith =>
      __$$_TracksResponceCopyWithImpl<_$_TracksResponce>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TracksResponceToJson(
      this,
    );
  }
}

abstract class _TracksResponce implements TracksResponce {
  factory _TracksResponce({required final List<ChartItems> chart_items}) =
      _$_TracksResponce;

  factory _TracksResponce.fromJson(Map<String, dynamic> json) =
      _$_TracksResponce.fromJson;

  @override // ignore: invalid_annotation_target
  List<ChartItems> get chart_items;
  @override
  @JsonKey(ignore: true)
  _$$_TracksResponceCopyWith<_$_TracksResponce> get copyWith =>
      throw _privateConstructorUsedError;
}

ChartItems _$ChartItemsFromJson(Map<String, dynamic> json) {
  return _ChartItems.fromJson(json);
}

/// @nodoc
mixin _$ChartItems {
  Item get item => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChartItemsCopyWith<ChartItems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartItemsCopyWith<$Res> {
  factory $ChartItemsCopyWith(
          ChartItems value, $Res Function(ChartItems) then) =
      _$ChartItemsCopyWithImpl<$Res, ChartItems>;
  @useResult
  $Res call({Item item});

  $ItemCopyWith<$Res> get item;
}

/// @nodoc
class _$ChartItemsCopyWithImpl<$Res, $Val extends ChartItems>
    implements $ChartItemsCopyWith<$Res> {
  _$ChartItemsCopyWithImpl(this._value, this._then);

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
abstract class _$$_ChartItemsCopyWith<$Res>
    implements $ChartItemsCopyWith<$Res> {
  factory _$$_ChartItemsCopyWith(
          _$_ChartItems value, $Res Function(_$_ChartItems) then) =
      __$$_ChartItemsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Item item});

  @override
  $ItemCopyWith<$Res> get item;
}

/// @nodoc
class __$$_ChartItemsCopyWithImpl<$Res>
    extends _$ChartItemsCopyWithImpl<$Res, _$_ChartItems>
    implements _$$_ChartItemsCopyWith<$Res> {
  __$$_ChartItemsCopyWithImpl(
      _$_ChartItems _value, $Res Function(_$_ChartItems) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$_ChartItems(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChartItems implements _ChartItems {
  _$_ChartItems({required this.item});

  factory _$_ChartItems.fromJson(Map<String, dynamic> json) =>
      _$$_ChartItemsFromJson(json);

  @override
  final Item item;

  @override
  String toString() {
    return 'ChartItems(item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChartItems &&
            (identical(other.item, item) || other.item == item));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChartItemsCopyWith<_$_ChartItems> get copyWith =>
      __$$_ChartItemsCopyWithImpl<_$_ChartItems>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChartItemsToJson(
      this,
    );
  }
}

abstract class _ChartItems implements ChartItems {
  factory _ChartItems({required final Item item}) = _$_ChartItems;

  factory _ChartItems.fromJson(Map<String, dynamic> json) =
      _$_ChartItems.fromJson;

  @override
  Item get item;
  @override
  @JsonKey(ignore: true)
  _$$_ChartItemsCopyWith<_$_ChartItems> get copyWith =>
      throw _privateConstructorUsedError;
}

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  String? get artist_names => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get header_image_url => throw _privateConstructorUsedError;
  String? get cover_art_url => throw _privateConstructorUsedError;
  String? get release_date_for_display => throw _privateConstructorUsedError;
  String? get full_title => throw _privateConstructorUsedError;
  String? get image_url => throw _privateConstructorUsedError;
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
      {String? artist_names,
      String? name,
      String? title,
      String? header_image_url,
      String? cover_art_url,
      String? release_date_for_display,
      String? full_title,
      String? image_url,
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
    Object? artist_names = freezed,
    Object? name = freezed,
    Object? title = freezed,
    Object? header_image_url = freezed,
    Object? cover_art_url = freezed,
    Object? release_date_for_display = freezed,
    Object? full_title = freezed,
    Object? image_url = freezed,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      artist_names: freezed == artist_names
          ? _value.artist_names
          : artist_names // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      header_image_url: freezed == header_image_url
          ? _value.header_image_url
          : header_image_url // ignore: cast_nullable_to_non_nullable
              as String?,
      cover_art_url: freezed == cover_art_url
          ? _value.cover_art_url
          : cover_art_url // ignore: cast_nullable_to_non_nullable
              as String?,
      release_date_for_display: freezed == release_date_for_display
          ? _value.release_date_for_display
          : release_date_for_display // ignore: cast_nullable_to_non_nullable
              as String?,
      full_title: freezed == full_title
          ? _value.full_title
          : full_title // ignore: cast_nullable_to_non_nullable
              as String?,
      image_url: freezed == image_url
          ? _value.image_url
          : image_url // ignore: cast_nullable_to_non_nullable
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
      {String? artist_names,
      String? name,
      String? title,
      String? header_image_url,
      String? cover_art_url,
      String? release_date_for_display,
      String? full_title,
      String? image_url,
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
    Object? artist_names = freezed,
    Object? name = freezed,
    Object? title = freezed,
    Object? header_image_url = freezed,
    Object? cover_art_url = freezed,
    Object? release_date_for_display = freezed,
    Object? full_title = freezed,
    Object? image_url = freezed,
    Object? id = null,
  }) {
    return _then(_$_Item(
      artist_names: freezed == artist_names
          ? _value.artist_names
          : artist_names // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      header_image_url: freezed == header_image_url
          ? _value.header_image_url
          : header_image_url // ignore: cast_nullable_to_non_nullable
              as String?,
      cover_art_url: freezed == cover_art_url
          ? _value.cover_art_url
          : cover_art_url // ignore: cast_nullable_to_non_nullable
              as String?,
      release_date_for_display: freezed == release_date_for_display
          ? _value.release_date_for_display
          : release_date_for_display // ignore: cast_nullable_to_non_nullable
              as String?,
      full_title: freezed == full_title
          ? _value.full_title
          : full_title // ignore: cast_nullable_to_non_nullable
              as String?,
      image_url: freezed == image_url
          ? _value.image_url
          : image_url // ignore: cast_nullable_to_non_nullable
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
      {required this.artist_names,
      required this.name,
      required this.title,
      required this.header_image_url,
      required this.cover_art_url,
      required this.release_date_for_display,
      required this.full_title,
      required this.image_url,
      required this.id});

  factory _$_Item.fromJson(Map<String, dynamic> json) => _$$_ItemFromJson(json);

  @override
  final String? artist_names;
  @override
  final String? name;
  @override
  final String? title;
  @override
  final String? header_image_url;
  @override
  final String? cover_art_url;
  @override
  final String? release_date_for_display;
  @override
  final String? full_title;
  @override
  final String? image_url;
  @override
  final int id;

  @override
  String toString() {
    return 'Item(artist_names: $artist_names, name: $name, title: $title, header_image_url: $header_image_url, cover_art_url: $cover_art_url, release_date_for_display: $release_date_for_display, full_title: $full_title, image_url: $image_url, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Item &&
            (identical(other.artist_names, artist_names) ||
                other.artist_names == artist_names) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.header_image_url, header_image_url) ||
                other.header_image_url == header_image_url) &&
            (identical(other.cover_art_url, cover_art_url) ||
                other.cover_art_url == cover_art_url) &&
            (identical(
                    other.release_date_for_display, release_date_for_display) ||
                other.release_date_for_display == release_date_for_display) &&
            (identical(other.full_title, full_title) ||
                other.full_title == full_title) &&
            (identical(other.image_url, image_url) ||
                other.image_url == image_url) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      artist_names,
      name,
      title,
      header_image_url,
      cover_art_url,
      release_date_for_display,
      full_title,
      image_url,
      id);

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
      {required final String? artist_names,
      required final String? name,
      required final String? title,
      required final String? header_image_url,
      required final String? cover_art_url,
      required final String? release_date_for_display,
      required final String? full_title,
      required final String? image_url,
      required final int id}) = _$_Item;

  factory _Item.fromJson(Map<String, dynamic> json) = _$_Item.fromJson;

  @override
  String? get artist_names;
  @override
  String? get name;
  @override
  String? get title;
  @override
  String? get header_image_url;
  @override
  String? get cover_art_url;
  @override
  String? get release_date_for_display;
  @override
  String? get full_title;
  @override
  String? get image_url;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_ItemCopyWith<_$_Item> get copyWith => throw _privateConstructorUsedError;
}
