// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'serch_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchEvent _$SearchEventFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'textChanged':
      return TextChangedSearchEvent.fromJson(json);
    case 'loadSearchResults':
      return LoadSearchEvent.fromJson(json);
    case 'loadMoreItems':
      return LoadMoreItemsSearchEvent.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'SearchEvent',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$SearchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String newText) textChanged,
    required TResult Function(String newText) loadSearchResults,
    required TResult Function(String text) loadMoreItems,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String newText)? textChanged,
    TResult? Function(String newText)? loadSearchResults,
    TResult? Function(String text)? loadMoreItems,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String newText)? textChanged,
    TResult Function(String newText)? loadSearchResults,
    TResult Function(String text)? loadMoreItems,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextChangedSearchEvent value) textChanged,
    required TResult Function(LoadSearchEvent value) loadSearchResults,
    required TResult Function(LoadMoreItemsSearchEvent value) loadMoreItems,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextChangedSearchEvent value)? textChanged,
    TResult? Function(LoadSearchEvent value)? loadSearchResults,
    TResult? Function(LoadMoreItemsSearchEvent value)? loadMoreItems,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextChangedSearchEvent value)? textChanged,
    TResult Function(LoadSearchEvent value)? loadSearchResults,
    TResult Function(LoadMoreItemsSearchEvent value)? loadMoreItems,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchEventCopyWith<$Res> {
  factory $SearchEventCopyWith(
          SearchEvent value, $Res Function(SearchEvent) then) =
      _$SearchEventCopyWithImpl<$Res, SearchEvent>;
}

/// @nodoc
class _$SearchEventCopyWithImpl<$Res, $Val extends SearchEvent>
    implements $SearchEventCopyWith<$Res> {
  _$SearchEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$TextChangedSearchEventCopyWith<$Res> {
  factory _$$TextChangedSearchEventCopyWith(_$TextChangedSearchEvent value,
          $Res Function(_$TextChangedSearchEvent) then) =
      __$$TextChangedSearchEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String newText});
}

/// @nodoc
class __$$TextChangedSearchEventCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$TextChangedSearchEvent>
    implements _$$TextChangedSearchEventCopyWith<$Res> {
  __$$TextChangedSearchEventCopyWithImpl(_$TextChangedSearchEvent _value,
      $Res Function(_$TextChangedSearchEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newText = null,
  }) {
    return _then(_$TextChangedSearchEvent(
      newText: null == newText
          ? _value.newText
          : newText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TextChangedSearchEvent implements TextChangedSearchEvent {
  const _$TextChangedSearchEvent({required this.newText, final String? $type})
      : $type = $type ?? 'textChanged';

  factory _$TextChangedSearchEvent.fromJson(Map<String, dynamic> json) =>
      _$$TextChangedSearchEventFromJson(json);

  @override
  final String newText;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SearchEvent.textChanged(newText: $newText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextChangedSearchEvent &&
            (identical(other.newText, newText) || other.newText == newText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, newText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TextChangedSearchEventCopyWith<_$TextChangedSearchEvent> get copyWith =>
      __$$TextChangedSearchEventCopyWithImpl<_$TextChangedSearchEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String newText) textChanged,
    required TResult Function(String newText) loadSearchResults,
    required TResult Function(String text) loadMoreItems,
  }) {
    return textChanged(newText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String newText)? textChanged,
    TResult? Function(String newText)? loadSearchResults,
    TResult? Function(String text)? loadMoreItems,
  }) {
    return textChanged?.call(newText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String newText)? textChanged,
    TResult Function(String newText)? loadSearchResults,
    TResult Function(String text)? loadMoreItems,
    required TResult orElse(),
  }) {
    if (textChanged != null) {
      return textChanged(newText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextChangedSearchEvent value) textChanged,
    required TResult Function(LoadSearchEvent value) loadSearchResults,
    required TResult Function(LoadMoreItemsSearchEvent value) loadMoreItems,
  }) {
    return textChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextChangedSearchEvent value)? textChanged,
    TResult? Function(LoadSearchEvent value)? loadSearchResults,
    TResult? Function(LoadMoreItemsSearchEvent value)? loadMoreItems,
  }) {
    return textChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextChangedSearchEvent value)? textChanged,
    TResult Function(LoadSearchEvent value)? loadSearchResults,
    TResult Function(LoadMoreItemsSearchEvent value)? loadMoreItems,
    required TResult orElse(),
  }) {
    if (textChanged != null) {
      return textChanged(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TextChangedSearchEventToJson(
      this,
    );
  }
}

abstract class TextChangedSearchEvent implements SearchEvent {
  const factory TextChangedSearchEvent({required final String newText}) =
      _$TextChangedSearchEvent;

  factory TextChangedSearchEvent.fromJson(Map<String, dynamic> json) =
      _$TextChangedSearchEvent.fromJson;

  String get newText;
  @JsonKey(ignore: true)
  _$$TextChangedSearchEventCopyWith<_$TextChangedSearchEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadSearchEventCopyWith<$Res> {
  factory _$$LoadSearchEventCopyWith(
          _$LoadSearchEvent value, $Res Function(_$LoadSearchEvent) then) =
      __$$LoadSearchEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String newText});
}

/// @nodoc
class __$$LoadSearchEventCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$LoadSearchEvent>
    implements _$$LoadSearchEventCopyWith<$Res> {
  __$$LoadSearchEventCopyWithImpl(
      _$LoadSearchEvent _value, $Res Function(_$LoadSearchEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newText = null,
  }) {
    return _then(_$LoadSearchEvent(
      newText: null == newText
          ? _value.newText
          : newText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoadSearchEvent implements LoadSearchEvent {
  const _$LoadSearchEvent({required this.newText, final String? $type})
      : $type = $type ?? 'loadSearchResults';

  factory _$LoadSearchEvent.fromJson(Map<String, dynamic> json) =>
      _$$LoadSearchEventFromJson(json);

  @override
  final String newText;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SearchEvent.loadSearchResults(newText: $newText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadSearchEvent &&
            (identical(other.newText, newText) || other.newText == newText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, newText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadSearchEventCopyWith<_$LoadSearchEvent> get copyWith =>
      __$$LoadSearchEventCopyWithImpl<_$LoadSearchEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String newText) textChanged,
    required TResult Function(String newText) loadSearchResults,
    required TResult Function(String text) loadMoreItems,
  }) {
    return loadSearchResults(newText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String newText)? textChanged,
    TResult? Function(String newText)? loadSearchResults,
    TResult? Function(String text)? loadMoreItems,
  }) {
    return loadSearchResults?.call(newText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String newText)? textChanged,
    TResult Function(String newText)? loadSearchResults,
    TResult Function(String text)? loadMoreItems,
    required TResult orElse(),
  }) {
    if (loadSearchResults != null) {
      return loadSearchResults(newText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextChangedSearchEvent value) textChanged,
    required TResult Function(LoadSearchEvent value) loadSearchResults,
    required TResult Function(LoadMoreItemsSearchEvent value) loadMoreItems,
  }) {
    return loadSearchResults(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextChangedSearchEvent value)? textChanged,
    TResult? Function(LoadSearchEvent value)? loadSearchResults,
    TResult? Function(LoadMoreItemsSearchEvent value)? loadMoreItems,
  }) {
    return loadSearchResults?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextChangedSearchEvent value)? textChanged,
    TResult Function(LoadSearchEvent value)? loadSearchResults,
    TResult Function(LoadMoreItemsSearchEvent value)? loadMoreItems,
    required TResult orElse(),
  }) {
    if (loadSearchResults != null) {
      return loadSearchResults(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LoadSearchEventToJson(
      this,
    );
  }
}

abstract class LoadSearchEvent implements SearchEvent {
  const factory LoadSearchEvent({required final String newText}) =
      _$LoadSearchEvent;

  factory LoadSearchEvent.fromJson(Map<String, dynamic> json) =
      _$LoadSearchEvent.fromJson;

  String get newText;
  @JsonKey(ignore: true)
  _$$LoadSearchEventCopyWith<_$LoadSearchEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMoreItemsSearchEventCopyWith<$Res> {
  factory _$$LoadMoreItemsSearchEventCopyWith(_$LoadMoreItemsSearchEvent value,
          $Res Function(_$LoadMoreItemsSearchEvent) then) =
      __$$LoadMoreItemsSearchEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$LoadMoreItemsSearchEventCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$LoadMoreItemsSearchEvent>
    implements _$$LoadMoreItemsSearchEventCopyWith<$Res> {
  __$$LoadMoreItemsSearchEventCopyWithImpl(_$LoadMoreItemsSearchEvent _value,
      $Res Function(_$LoadMoreItemsSearchEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$LoadMoreItemsSearchEvent(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoadMoreItemsSearchEvent implements LoadMoreItemsSearchEvent {
  const _$LoadMoreItemsSearchEvent({required this.text, final String? $type})
      : $type = $type ?? 'loadMoreItems';

  factory _$LoadMoreItemsSearchEvent.fromJson(Map<String, dynamic> json) =>
      _$$LoadMoreItemsSearchEventFromJson(json);

  @override
  final String text;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SearchEvent.loadMoreItems(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadMoreItemsSearchEvent &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadMoreItemsSearchEventCopyWith<_$LoadMoreItemsSearchEvent>
      get copyWith =>
          __$$LoadMoreItemsSearchEventCopyWithImpl<_$LoadMoreItemsSearchEvent>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String newText) textChanged,
    required TResult Function(String newText) loadSearchResults,
    required TResult Function(String text) loadMoreItems,
  }) {
    return loadMoreItems(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String newText)? textChanged,
    TResult? Function(String newText)? loadSearchResults,
    TResult? Function(String text)? loadMoreItems,
  }) {
    return loadMoreItems?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String newText)? textChanged,
    TResult Function(String newText)? loadSearchResults,
    TResult Function(String text)? loadMoreItems,
    required TResult orElse(),
  }) {
    if (loadMoreItems != null) {
      return loadMoreItems(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextChangedSearchEvent value) textChanged,
    required TResult Function(LoadSearchEvent value) loadSearchResults,
    required TResult Function(LoadMoreItemsSearchEvent value) loadMoreItems,
  }) {
    return loadMoreItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextChangedSearchEvent value)? textChanged,
    TResult? Function(LoadSearchEvent value)? loadSearchResults,
    TResult? Function(LoadMoreItemsSearchEvent value)? loadMoreItems,
  }) {
    return loadMoreItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextChangedSearchEvent value)? textChanged,
    TResult Function(LoadSearchEvent value)? loadSearchResults,
    TResult Function(LoadMoreItemsSearchEvent value)? loadMoreItems,
    required TResult orElse(),
  }) {
    if (loadMoreItems != null) {
      return loadMoreItems(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LoadMoreItemsSearchEventToJson(
      this,
    );
  }
}

abstract class LoadMoreItemsSearchEvent implements SearchEvent {
  const factory LoadMoreItemsSearchEvent({required final String text}) =
      _$LoadMoreItemsSearchEvent;

  factory LoadMoreItemsSearchEvent.fromJson(Map<String, dynamic> json) =
      _$LoadMoreItemsSearchEvent.fromJson;

  String get text;
  @JsonKey(ignore: true)
  _$$LoadMoreItemsSearchEventCopyWith<_$LoadMoreItemsSearchEvent>
      get copyWith => throw _privateConstructorUsedError;
}
