// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchState _$SearchStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'empty':
      return EmptySearchState.fromJson(json);
    case 'loading':
      return LoadingSearchState.fromJson(json);
    case 'noResults':
      return NoResultsSearchState.fromJson(json);
    case 'loaded':
      return LoadedSearchState.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'SearchState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$SearchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function() noResults,
    required TResult Function(List<SearchData> data) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function()? noResults,
    TResult? Function(List<SearchData> data)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function()? noResults,
    TResult Function(List<SearchData> data)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptySearchState value) empty,
    required TResult Function(LoadingSearchState value) loading,
    required TResult Function(NoResultsSearchState value) noResults,
    required TResult Function(LoadedSearchState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptySearchState value)? empty,
    TResult? Function(LoadingSearchState value)? loading,
    TResult? Function(NoResultsSearchState value)? noResults,
    TResult? Function(LoadedSearchState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptySearchState value)? empty,
    TResult Function(LoadingSearchState value)? loading,
    TResult Function(NoResultsSearchState value)? noResults,
    TResult Function(LoadedSearchState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res, SearchState>;
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EmptySearchStateCopyWith<$Res> {
  factory _$$EmptySearchStateCopyWith(
          _$EmptySearchState value, $Res Function(_$EmptySearchState) then) =
      __$$EmptySearchStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptySearchStateCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$EmptySearchState>
    implements _$$EmptySearchStateCopyWith<$Res> {
  __$$EmptySearchStateCopyWithImpl(
      _$EmptySearchState _value, $Res Function(_$EmptySearchState) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$EmptySearchState implements EmptySearchState {
  const _$EmptySearchState({final String? $type}) : $type = $type ?? 'empty';

  factory _$EmptySearchState.fromJson(Map<String, dynamic> json) =>
      _$$EmptySearchStateFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SearchState.empty()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function() noResults,
    required TResult Function(List<SearchData> data) loaded,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function()? noResults,
    TResult? Function(List<SearchData> data)? loaded,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function()? noResults,
    TResult Function(List<SearchData> data)? loaded,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptySearchState value) empty,
    required TResult Function(LoadingSearchState value) loading,
    required TResult Function(NoResultsSearchState value) noResults,
    required TResult Function(LoadedSearchState value) loaded,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptySearchState value)? empty,
    TResult? Function(LoadingSearchState value)? loading,
    TResult? Function(NoResultsSearchState value)? noResults,
    TResult? Function(LoadedSearchState value)? loaded,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptySearchState value)? empty,
    TResult Function(LoadingSearchState value)? loading,
    TResult Function(NoResultsSearchState value)? noResults,
    TResult Function(LoadedSearchState value)? loaded,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EmptySearchStateToJson(
      this,
    );
  }
}

abstract class EmptySearchState implements SearchState {
  const factory EmptySearchState() = _$EmptySearchState;

  factory EmptySearchState.fromJson(Map<String, dynamic> json) =
      _$EmptySearchState.fromJson;
}

/// @nodoc
abstract class _$$LoadingSearchStateCopyWith<$Res> {
  factory _$$LoadingSearchStateCopyWith(_$LoadingSearchState value,
          $Res Function(_$LoadingSearchState) then) =
      __$$LoadingSearchStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingSearchStateCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$LoadingSearchState>
    implements _$$LoadingSearchStateCopyWith<$Res> {
  __$$LoadingSearchStateCopyWithImpl(
      _$LoadingSearchState _value, $Res Function(_$LoadingSearchState) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$LoadingSearchState implements LoadingSearchState {
  const _$LoadingSearchState({final String? $type})
      : $type = $type ?? 'loading';

  factory _$LoadingSearchState.fromJson(Map<String, dynamic> json) =>
      _$$LoadingSearchStateFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SearchState.loading()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function() noResults,
    required TResult Function(List<SearchData> data) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function()? noResults,
    TResult? Function(List<SearchData> data)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function()? noResults,
    TResult Function(List<SearchData> data)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptySearchState value) empty,
    required TResult Function(LoadingSearchState value) loading,
    required TResult Function(NoResultsSearchState value) noResults,
    required TResult Function(LoadedSearchState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptySearchState value)? empty,
    TResult? Function(LoadingSearchState value)? loading,
    TResult? Function(NoResultsSearchState value)? noResults,
    TResult? Function(LoadedSearchState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptySearchState value)? empty,
    TResult Function(LoadingSearchState value)? loading,
    TResult Function(NoResultsSearchState value)? noResults,
    TResult Function(LoadedSearchState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LoadingSearchStateToJson(
      this,
    );
  }
}

abstract class LoadingSearchState implements SearchState {
  const factory LoadingSearchState() = _$LoadingSearchState;

  factory LoadingSearchState.fromJson(Map<String, dynamic> json) =
      _$LoadingSearchState.fromJson;
}

/// @nodoc
abstract class _$$NoResultsSearchStateCopyWith<$Res> {
  factory _$$NoResultsSearchStateCopyWith(_$NoResultsSearchState value,
          $Res Function(_$NoResultsSearchState) then) =
      __$$NoResultsSearchStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoResultsSearchStateCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$NoResultsSearchState>
    implements _$$NoResultsSearchStateCopyWith<$Res> {
  __$$NoResultsSearchStateCopyWithImpl(_$NoResultsSearchState _value,
      $Res Function(_$NoResultsSearchState) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$NoResultsSearchState implements NoResultsSearchState {
  const _$NoResultsSearchState({final String? $type})
      : $type = $type ?? 'noResults';

  factory _$NoResultsSearchState.fromJson(Map<String, dynamic> json) =>
      _$$NoResultsSearchStateFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SearchState.noResults()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function() noResults,
    required TResult Function(List<SearchData> data) loaded,
  }) {
    return noResults();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function()? noResults,
    TResult? Function(List<SearchData> data)? loaded,
  }) {
    return noResults?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function()? noResults,
    TResult Function(List<SearchData> data)? loaded,
    required TResult orElse(),
  }) {
    if (noResults != null) {
      return noResults();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptySearchState value) empty,
    required TResult Function(LoadingSearchState value) loading,
    required TResult Function(NoResultsSearchState value) noResults,
    required TResult Function(LoadedSearchState value) loaded,
  }) {
    return noResults(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptySearchState value)? empty,
    TResult? Function(LoadingSearchState value)? loading,
    TResult? Function(NoResultsSearchState value)? noResults,
    TResult? Function(LoadedSearchState value)? loaded,
  }) {
    return noResults?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptySearchState value)? empty,
    TResult Function(LoadingSearchState value)? loading,
    TResult Function(NoResultsSearchState value)? noResults,
    TResult Function(LoadedSearchState value)? loaded,
    required TResult orElse(),
  }) {
    if (noResults != null) {
      return noResults(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NoResultsSearchStateToJson(
      this,
    );
  }
}

abstract class NoResultsSearchState implements SearchState {
  const factory NoResultsSearchState() = _$NoResultsSearchState;

  factory NoResultsSearchState.fromJson(Map<String, dynamic> json) =
      _$NoResultsSearchState.fromJson;
}

/// @nodoc
abstract class _$$LoadedSearchStateCopyWith<$Res> {
  factory _$$LoadedSearchStateCopyWith(
          _$LoadedSearchState value, $Res Function(_$LoadedSearchState) then) =
      __$$LoadedSearchStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SearchData> data});
}

/// @nodoc
class __$$LoadedSearchStateCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$LoadedSearchState>
    implements _$$LoadedSearchStateCopyWith<$Res> {
  __$$LoadedSearchStateCopyWithImpl(
      _$LoadedSearchState _value, $Res Function(_$LoadedSearchState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LoadedSearchState(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SearchData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoadedSearchState implements LoadedSearchState {
  const _$LoadedSearchState(
      {required final List<SearchData> data, final String? $type})
      : _data = data,
        $type = $type ?? 'loaded';

  factory _$LoadedSearchState.fromJson(Map<String, dynamic> json) =>
      _$$LoadedSearchStateFromJson(json);

  final List<SearchData> _data;
  @override
  List<SearchData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SearchState.loaded(data: $data)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedSearchStateCopyWith<_$LoadedSearchState> get copyWith =>
      __$$LoadedSearchStateCopyWithImpl<_$LoadedSearchState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function() noResults,
    required TResult Function(List<SearchData> data) loaded,
  }) {
    return loaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function()? noResults,
    TResult? Function(List<SearchData> data)? loaded,
  }) {
    return loaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function()? noResults,
    TResult Function(List<SearchData> data)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptySearchState value) empty,
    required TResult Function(LoadingSearchState value) loading,
    required TResult Function(NoResultsSearchState value) noResults,
    required TResult Function(LoadedSearchState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptySearchState value)? empty,
    TResult? Function(LoadingSearchState value)? loading,
    TResult? Function(NoResultsSearchState value)? noResults,
    TResult? Function(LoadedSearchState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptySearchState value)? empty,
    TResult Function(LoadingSearchState value)? loading,
    TResult Function(NoResultsSearchState value)? noResults,
    TResult Function(LoadedSearchState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LoadedSearchStateToJson(
      this,
    );
  }
}

abstract class LoadedSearchState implements SearchState {
  const factory LoadedSearchState({required final List<SearchData> data}) =
      _$LoadedSearchState;

  factory LoadedSearchState.fromJson(Map<String, dynamic> json) =
      _$LoadedSearchState.fromJson;

  List<SearchData> get data;
  @JsonKey(ignore: true)
  _$$LoadedSearchStateCopyWith<_$LoadedSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
