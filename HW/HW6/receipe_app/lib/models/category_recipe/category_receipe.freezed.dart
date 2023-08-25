// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_receipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryRecipeResponce _$CategoryRecipeResponceFromJson(
    Map<String, dynamic> json) {
  return _CategoryReceipeResponce.fromJson(json);
}

/// @nodoc
mixin _$CategoryRecipeResponce {
  @JsonKey(name: 'browse-categories')
  List<CategoryData> get browseCategories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryRecipeResponceCopyWith<CategoryRecipeResponce> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryRecipeResponceCopyWith<$Res> {
  factory $CategoryRecipeResponceCopyWith(CategoryRecipeResponce value,
          $Res Function(CategoryRecipeResponce) then) =
      _$CategoryRecipeResponceCopyWithImpl<$Res, CategoryRecipeResponce>;
  @useResult
  $Res call(
      {@JsonKey(name: 'browse-categories')
      List<CategoryData> browseCategories});
}

/// @nodoc
class _$CategoryRecipeResponceCopyWithImpl<$Res,
        $Val extends CategoryRecipeResponce>
    implements $CategoryRecipeResponceCopyWith<$Res> {
  _$CategoryRecipeResponceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? browseCategories = null,
  }) {
    return _then(_value.copyWith(
      browseCategories: null == browseCategories
          ? _value.browseCategories
          : browseCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryReceipeResponceCopyWith<$Res>
    implements $CategoryRecipeResponceCopyWith<$Res> {
  factory _$$_CategoryReceipeResponceCopyWith(_$_CategoryReceipeResponce value,
          $Res Function(_$_CategoryReceipeResponce) then) =
      __$$_CategoryReceipeResponceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'browse-categories')
      List<CategoryData> browseCategories});
}

/// @nodoc
class __$$_CategoryReceipeResponceCopyWithImpl<$Res>
    extends _$CategoryRecipeResponceCopyWithImpl<$Res,
        _$_CategoryReceipeResponce>
    implements _$$_CategoryReceipeResponceCopyWith<$Res> {
  __$$_CategoryReceipeResponceCopyWithImpl(_$_CategoryReceipeResponce _value,
      $Res Function(_$_CategoryReceipeResponce) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? browseCategories = null,
  }) {
    return _then(_$_CategoryReceipeResponce(
      browseCategories: null == browseCategories
          ? _value._browseCategories
          : browseCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CategoryReceipeResponce implements _CategoryReceipeResponce {
  _$_CategoryReceipeResponce(
      {@JsonKey(name: 'browse-categories')
      required final List<CategoryData> browseCategories})
      : _browseCategories = browseCategories;

  factory _$_CategoryReceipeResponce.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryReceipeResponceFromJson(json);

  final List<CategoryData> _browseCategories;

  @override
  @JsonKey(name: 'browse-categories')
  List<CategoryData> get browseCategories {
    if (_browseCategories is EqualUnmodifiableListView)
      return _browseCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_browseCategories);
  }

  @override
  String toString() {
    return 'CategoryRecipeResponce(browseCategories: $browseCategories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryReceipeResponce &&
            const DeepCollectionEquality()
                .equals(other._browseCategories, _browseCategories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_browseCategories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryReceipeResponceCopyWith<_$_CategoryReceipeResponce>
      get copyWith =>
          __$$_CategoryReceipeResponceCopyWithImpl<_$_CategoryReceipeResponce>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryReceipeResponceToJson(
      this,
    );
  }
}

abstract class _CategoryReceipeResponce implements CategoryRecipeResponce {
  factory _CategoryReceipeResponce(
          {@JsonKey(name: 'browse-categories')
          required final List<CategoryData> browseCategories}) =
      _$_CategoryReceipeResponce;

  factory _CategoryReceipeResponce.fromJson(Map<String, dynamic> json) =
      _$_CategoryReceipeResponce.fromJson;

  @JsonKey(name: 'browse-categories')
  List<CategoryData> get browseCategories;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryReceipeResponceCopyWith<_$_CategoryReceipeResponce>
      get copyWith => throw _privateConstructorUsedError;
}

CategoryData _$CategoryDataFromJson(Map<String, dynamic> json) {
  return _CategoryData.fromJson(json);
}

/// @nodoc
mixin _$CategoryData {
  CategoryDisplay get display => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryDataCopyWith<CategoryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryDataCopyWith<$Res> {
  factory $CategoryDataCopyWith(
          CategoryData value, $Res Function(CategoryData) then) =
      _$CategoryDataCopyWithImpl<$Res, CategoryData>;
  @useResult
  $Res call({CategoryDisplay display});

  $CategoryDisplayCopyWith<$Res> get display;
}

/// @nodoc
class _$CategoryDataCopyWithImpl<$Res, $Val extends CategoryData>
    implements $CategoryDataCopyWith<$Res> {
  _$CategoryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? display = null,
  }) {
    return _then(_value.copyWith(
      display: null == display
          ? _value.display
          : display // ignore: cast_nullable_to_non_nullable
              as CategoryDisplay,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryDisplayCopyWith<$Res> get display {
    return $CategoryDisplayCopyWith<$Res>(_value.display, (value) {
      return _then(_value.copyWith(display: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CategoryDataCopyWith<$Res>
    implements $CategoryDataCopyWith<$Res> {
  factory _$$_CategoryDataCopyWith(
          _$_CategoryData value, $Res Function(_$_CategoryData) then) =
      __$$_CategoryDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CategoryDisplay display});

  @override
  $CategoryDisplayCopyWith<$Res> get display;
}

/// @nodoc
class __$$_CategoryDataCopyWithImpl<$Res>
    extends _$CategoryDataCopyWithImpl<$Res, _$_CategoryData>
    implements _$$_CategoryDataCopyWith<$Res> {
  __$$_CategoryDataCopyWithImpl(
      _$_CategoryData _value, $Res Function(_$_CategoryData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? display = null,
  }) {
    return _then(_$_CategoryData(
      display: null == display
          ? _value.display
          : display // ignore: cast_nullable_to_non_nullable
              as CategoryDisplay,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CategoryData implements _CategoryData {
  _$_CategoryData({required this.display});

  factory _$_CategoryData.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryDataFromJson(json);

  @override
  final CategoryDisplay display;

  @override
  String toString() {
    return 'CategoryData(display: $display)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryData &&
            (identical(other.display, display) || other.display == display));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, display);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryDataCopyWith<_$_CategoryData> get copyWith =>
      __$$_CategoryDataCopyWithImpl<_$_CategoryData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryDataToJson(
      this,
    );
  }
}

abstract class _CategoryData implements CategoryData {
  factory _CategoryData({required final CategoryDisplay display}) =
      _$_CategoryData;

  factory _CategoryData.fromJson(Map<String, dynamic> json) =
      _$_CategoryData.fromJson;

  @override
  CategoryDisplay get display;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryDataCopyWith<_$_CategoryData> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryDisplay _$CategoryDisplayFromJson(Map<String, dynamic> json) {
  return _CategoryDisplay.fromJson(json);
}

/// @nodoc
mixin _$CategoryDisplay {
  String get displayName => throw _privateConstructorUsedError;
  String get categoryImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryDisplayCopyWith<CategoryDisplay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryDisplayCopyWith<$Res> {
  factory $CategoryDisplayCopyWith(
          CategoryDisplay value, $Res Function(CategoryDisplay) then) =
      _$CategoryDisplayCopyWithImpl<$Res, CategoryDisplay>;
  @useResult
  $Res call({String displayName, String categoryImage});
}

/// @nodoc
class _$CategoryDisplayCopyWithImpl<$Res, $Val extends CategoryDisplay>
    implements $CategoryDisplayCopyWith<$Res> {
  _$CategoryDisplayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? categoryImage = null,
  }) {
    return _then(_value.copyWith(
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryImage: null == categoryImage
          ? _value.categoryImage
          : categoryImage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryDisplayCopyWith<$Res>
    implements $CategoryDisplayCopyWith<$Res> {
  factory _$$_CategoryDisplayCopyWith(
          _$_CategoryDisplay value, $Res Function(_$_CategoryDisplay) then) =
      __$$_CategoryDisplayCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String displayName, String categoryImage});
}

/// @nodoc
class __$$_CategoryDisplayCopyWithImpl<$Res>
    extends _$CategoryDisplayCopyWithImpl<$Res, _$_CategoryDisplay>
    implements _$$_CategoryDisplayCopyWith<$Res> {
  __$$_CategoryDisplayCopyWithImpl(
      _$_CategoryDisplay _value, $Res Function(_$_CategoryDisplay) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? categoryImage = null,
  }) {
    return _then(_$_CategoryDisplay(
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryImage: null == categoryImage
          ? _value.categoryImage
          : categoryImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CategoryDisplay implements _CategoryDisplay {
  _$_CategoryDisplay({required this.displayName, required this.categoryImage});

  factory _$_CategoryDisplay.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryDisplayFromJson(json);

  @override
  final String displayName;
  @override
  final String categoryImage;

  @override
  String toString() {
    return 'CategoryDisplay(displayName: $displayName, categoryImage: $categoryImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryDisplay &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.categoryImage, categoryImage) ||
                other.categoryImage == categoryImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, displayName, categoryImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryDisplayCopyWith<_$_CategoryDisplay> get copyWith =>
      __$$_CategoryDisplayCopyWithImpl<_$_CategoryDisplay>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryDisplayToJson(
      this,
    );
  }
}

abstract class _CategoryDisplay implements CategoryDisplay {
  factory _CategoryDisplay(
      {required final String displayName,
      required final String categoryImage}) = _$_CategoryDisplay;

  factory _CategoryDisplay.fromJson(Map<String, dynamic> json) =
      _$_CategoryDisplay.fromJson;

  @override
  String get displayName;
  @override
  String get categoryImage;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryDisplayCopyWith<_$_CategoryDisplay> get copyWith =>
      throw _privateConstructorUsedError;
}
