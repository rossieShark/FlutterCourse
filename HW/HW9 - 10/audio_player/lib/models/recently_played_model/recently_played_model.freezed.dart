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
  @JsonKey(name: 'chart_items')
  List<RecentlyPlayedlist> get charItems => throw _privateConstructorUsedError;

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
  $Res call({@JsonKey(name: 'chart_items') List<RecentlyPlayedlist> charItems});
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
    Object? charItems = null,
  }) {
    return _then(_value.copyWith(
      charItems: null == charItems
          ? _value.charItems
          : charItems // ignore: cast_nullable_to_non_nullable
              as List<RecentlyPlayedlist>,
    ) as $Val);
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
  $Res call({@JsonKey(name: 'chart_items') List<RecentlyPlayedlist> charItems});
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
    Object? charItems = null,
  }) {
    return _then(_$_RecentlyPlayedResponse(
      charItems: null == charItems
          ? _value._charItems
          : charItems // ignore: cast_nullable_to_non_nullable
              as List<RecentlyPlayedlist>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecentlyPlayedResponse implements _RecentlyPlayedResponse {
  _$_RecentlyPlayedResponse(
      {@JsonKey(name: 'chart_items')
      required final List<RecentlyPlayedlist> charItems})
      : _charItems = charItems;

  factory _$_RecentlyPlayedResponse.fromJson(Map<String, dynamic> json) =>
      _$$_RecentlyPlayedResponseFromJson(json);

  final List<RecentlyPlayedlist> _charItems;
  @override
  @JsonKey(name: 'chart_items')
  List<RecentlyPlayedlist> get charItems {
    if (_charItems is EqualUnmodifiableListView) return _charItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_charItems);
  }

  @override
  String toString() {
    return 'RecentlyPlayedResponse(charItems: $charItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecentlyPlayedResponse &&
            const DeepCollectionEquality()
                .equals(other._charItems, _charItems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_charItems));

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
  factory _RecentlyPlayedResponse(
          {@JsonKey(name: 'chart_items')
          required final List<RecentlyPlayedlist> charItems}) =
      _$_RecentlyPlayedResponse;

  factory _RecentlyPlayedResponse.fromJson(Map<String, dynamic> json) =
      _$_RecentlyPlayedResponse.fromJson;

  @override
  @JsonKey(name: 'chart_items')
  List<RecentlyPlayedlist> get charItems;
  @override
  @JsonKey(ignore: true)
  _$$_RecentlyPlayedResponseCopyWith<_$_RecentlyPlayedResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

RecentlyPlayedlist _$RecentlyPlayedlistFromJson(Map<String, dynamic> json) {
  return _RecentlyPlayedlist.fromJson(json);
}

/// @nodoc
mixin _$RecentlyPlayedlist {
  Item get item => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecentlyPlayedlistCopyWith<RecentlyPlayedlist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentlyPlayedlistCopyWith<$Res> {
  factory $RecentlyPlayedlistCopyWith(
          RecentlyPlayedlist value, $Res Function(RecentlyPlayedlist) then) =
      _$RecentlyPlayedlistCopyWithImpl<$Res, RecentlyPlayedlist>;
  @useResult
  $Res call({Item item});

  $ItemCopyWith<$Res> get item;
}

/// @nodoc
class _$RecentlyPlayedlistCopyWithImpl<$Res, $Val extends RecentlyPlayedlist>
    implements $RecentlyPlayedlistCopyWith<$Res> {
  _$RecentlyPlayedlistCopyWithImpl(this._value, this._then);

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
abstract class _$$_RecentlyPlayedlistCopyWith<$Res>
    implements $RecentlyPlayedlistCopyWith<$Res> {
  factory _$$_RecentlyPlayedlistCopyWith(_$_RecentlyPlayedlist value,
          $Res Function(_$_RecentlyPlayedlist) then) =
      __$$_RecentlyPlayedlistCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Item item});

  @override
  $ItemCopyWith<$Res> get item;
}

/// @nodoc
class __$$_RecentlyPlayedlistCopyWithImpl<$Res>
    extends _$RecentlyPlayedlistCopyWithImpl<$Res, _$_RecentlyPlayedlist>
    implements _$$_RecentlyPlayedlistCopyWith<$Res> {
  __$$_RecentlyPlayedlistCopyWithImpl(
      _$_RecentlyPlayedlist _value, $Res Function(_$_RecentlyPlayedlist) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$_RecentlyPlayedlist(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecentlyPlayedlist implements _RecentlyPlayedlist {
  _$_RecentlyPlayedlist({required this.item});

  factory _$_RecentlyPlayedlist.fromJson(Map<String, dynamic> json) =>
      _$$_RecentlyPlayedlistFromJson(json);

  @override
  final Item item;

  @override
  String toString() {
    return 'RecentlyPlayedlist(item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecentlyPlayedlist &&
            (identical(other.item, item) || other.item == item));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecentlyPlayedlistCopyWith<_$_RecentlyPlayedlist> get copyWith =>
      __$$_RecentlyPlayedlistCopyWithImpl<_$_RecentlyPlayedlist>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecentlyPlayedlistToJson(
      this,
    );
  }
}

abstract class _RecentlyPlayedlist implements RecentlyPlayedlist {
  factory _RecentlyPlayedlist({required final Item item}) =
      _$_RecentlyPlayedlist;

  factory _RecentlyPlayedlist.fromJson(Map<String, dynamic> json) =
      _$_RecentlyPlayedlist.fromJson;

  @override
  Item get item;
  @override
  @JsonKey(ignore: true)
  _$$_RecentlyPlayedlistCopyWith<_$_RecentlyPlayedlist> get copyWith =>
      throw _privateConstructorUsedError;
}

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  @JsonKey(name: 'artist_names')
  String? get artistNames => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'header_image_url')
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
      {@JsonKey(name: 'artist_names') String? artistNames,
      String? title,
      @JsonKey(name: 'header_image_url') String? imageUrl,
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
    Object? artistNames = freezed,
    Object? title = freezed,
    Object? imageUrl = freezed,
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
      {@JsonKey(name: 'artist_names') String? artistNames,
      String? title,
      @JsonKey(name: 'header_image_url') String? imageUrl,
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
    Object? artistNames = freezed,
    Object? title = freezed,
    Object? imageUrl = freezed,
    Object? id = null,
  }) {
    return _then(_$_Item(
      artistNames: freezed == artistNames
          ? _value.artistNames
          : artistNames // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
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
      {@JsonKey(name: 'artist_names') required this.artistNames,
      required this.title,
      @JsonKey(name: 'header_image_url') required this.imageUrl,
      required this.id});

  factory _$_Item.fromJson(Map<String, dynamic> json) => _$$_ItemFromJson(json);

  @override
  @JsonKey(name: 'artist_names')
  final String? artistNames;
  @override
  final String? title;
  @override
  @JsonKey(name: 'header_image_url')
  final String? imageUrl;
  @override
  final int id;

  @override
  String toString() {
    return 'Item(artistNames: $artistNames, title: $title, imageUrl: $imageUrl, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Item &&
            (identical(other.artistNames, artistNames) ||
                other.artistNames == artistNames) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, artistNames, title, imageUrl, id);

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
      {@JsonKey(name: 'artist_names') required final String? artistNames,
      required final String? title,
      @JsonKey(name: 'header_image_url') required final String? imageUrl,
      required final int id}) = _$_Item;

  factory _Item.fromJson(Map<String, dynamic> json) = _$_Item.fromJson;

  @override
  @JsonKey(name: 'artist_names')
  String? get artistNames;
  @override
  String? get title;
  @override
  @JsonKey(name: 'header_image_url')
  String? get imageUrl;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_ItemCopyWith<_$_Item> get copyWith => throw _privateConstructorUsedError;
}
