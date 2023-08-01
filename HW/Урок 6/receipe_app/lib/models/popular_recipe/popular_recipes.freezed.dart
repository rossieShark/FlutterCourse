// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'popular_recipes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecipeResponce _$RecipeResponceFromJson(Map<String, dynamic> json) {
  return _ReceipeResponce.fromJson(json);
}

/// @nodoc
mixin _$RecipeResponce {
  List<RecipeFeed> get feed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeResponceCopyWith<RecipeResponce> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeResponceCopyWith<$Res> {
  factory $RecipeResponceCopyWith(
          RecipeResponce value, $Res Function(RecipeResponce) then) =
      _$RecipeResponceCopyWithImpl<$Res, RecipeResponce>;
  @useResult
  $Res call({List<RecipeFeed> feed});
}

/// @nodoc
class _$RecipeResponceCopyWithImpl<$Res, $Val extends RecipeResponce>
    implements $RecipeResponceCopyWith<$Res> {
  _$RecipeResponceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feed = null,
  }) {
    return _then(_value.copyWith(
      feed: null == feed
          ? _value.feed
          : feed // ignore: cast_nullable_to_non_nullable
              as List<RecipeFeed>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReceipeResponceCopyWith<$Res>
    implements $RecipeResponceCopyWith<$Res> {
  factory _$$_ReceipeResponceCopyWith(
          _$_ReceipeResponce value, $Res Function(_$_ReceipeResponce) then) =
      __$$_ReceipeResponceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RecipeFeed> feed});
}

/// @nodoc
class __$$_ReceipeResponceCopyWithImpl<$Res>
    extends _$RecipeResponceCopyWithImpl<$Res, _$_ReceipeResponce>
    implements _$$_ReceipeResponceCopyWith<$Res> {
  __$$_ReceipeResponceCopyWithImpl(
      _$_ReceipeResponce _value, $Res Function(_$_ReceipeResponce) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feed = null,
  }) {
    return _then(_$_ReceipeResponce(
      feed: null == feed
          ? _value._feed
          : feed // ignore: cast_nullable_to_non_nullable
              as List<RecipeFeed>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReceipeResponce implements _ReceipeResponce {
  _$_ReceipeResponce({required final List<RecipeFeed> feed}) : _feed = feed;

  factory _$_ReceipeResponce.fromJson(Map<String, dynamic> json) =>
      _$$_ReceipeResponceFromJson(json);

  final List<RecipeFeed> _feed;
  @override
  List<RecipeFeed> get feed {
    if (_feed is EqualUnmodifiableListView) return _feed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_feed);
  }

  @override
  String toString() {
    return 'RecipeResponce(feed: $feed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReceipeResponce &&
            const DeepCollectionEquality().equals(other._feed, _feed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_feed));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReceipeResponceCopyWith<_$_ReceipeResponce> get copyWith =>
      __$$_ReceipeResponceCopyWithImpl<_$_ReceipeResponce>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReceipeResponceToJson(
      this,
    );
  }
}

abstract class _ReceipeResponce implements RecipeResponce {
  factory _ReceipeResponce({required final List<RecipeFeed> feed}) =
      _$_ReceipeResponce;

  factory _ReceipeResponce.fromJson(Map<String, dynamic> json) =
      _$_ReceipeResponce.fromJson;

  @override
  List<RecipeFeed> get feed;
  @override
  @JsonKey(ignore: true)
  _$$_ReceipeResponceCopyWith<_$_ReceipeResponce> get copyWith =>
      throw _privateConstructorUsedError;
}

RecipeFeed _$RecipeFeedFromJson(Map<String, dynamic> json) {
  return _ReceipeFeed.fromJson(json);
}

/// @nodoc
mixin _$RecipeFeed {
  RecipeContent get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeFeedCopyWith<RecipeFeed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeFeedCopyWith<$Res> {
  factory $RecipeFeedCopyWith(
          RecipeFeed value, $Res Function(RecipeFeed) then) =
      _$RecipeFeedCopyWithImpl<$Res, RecipeFeed>;
  @useResult
  $Res call({RecipeContent content});

  $RecipeContentCopyWith<$Res> get content;
}

/// @nodoc
class _$RecipeFeedCopyWithImpl<$Res, $Val extends RecipeFeed>
    implements $RecipeFeedCopyWith<$Res> {
  _$RecipeFeedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as RecipeContent,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RecipeContentCopyWith<$Res> get content {
    return $RecipeContentCopyWith<$Res>(_value.content, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ReceipeFeedCopyWith<$Res>
    implements $RecipeFeedCopyWith<$Res> {
  factory _$$_ReceipeFeedCopyWith(
          _$_ReceipeFeed value, $Res Function(_$_ReceipeFeed) then) =
      __$$_ReceipeFeedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RecipeContent content});

  @override
  $RecipeContentCopyWith<$Res> get content;
}

/// @nodoc
class __$$_ReceipeFeedCopyWithImpl<$Res>
    extends _$RecipeFeedCopyWithImpl<$Res, _$_ReceipeFeed>
    implements _$$_ReceipeFeedCopyWith<$Res> {
  __$$_ReceipeFeedCopyWithImpl(
      _$_ReceipeFeed _value, $Res Function(_$_ReceipeFeed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
  }) {
    return _then(_$_ReceipeFeed(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as RecipeContent,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReceipeFeed implements _ReceipeFeed {
  _$_ReceipeFeed({required this.content});

  factory _$_ReceipeFeed.fromJson(Map<String, dynamic> json) =>
      _$$_ReceipeFeedFromJson(json);

  @override
  final RecipeContent content;

  @override
  String toString() {
    return 'RecipeFeed(content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReceipeFeed &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReceipeFeedCopyWith<_$_ReceipeFeed> get copyWith =>
      __$$_ReceipeFeedCopyWithImpl<_$_ReceipeFeed>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReceipeFeedToJson(
      this,
    );
  }
}

abstract class _ReceipeFeed implements RecipeFeed {
  factory _ReceipeFeed({required final RecipeContent content}) = _$_ReceipeFeed;

  factory _ReceipeFeed.fromJson(Map<String, dynamic> json) =
      _$_ReceipeFeed.fromJson;

  @override
  RecipeContent get content;
  @override
  @JsonKey(ignore: true)
  _$$_ReceipeFeedCopyWith<_$_ReceipeFeed> get copyWith =>
      throw _privateConstructorUsedError;
}

RecipeContent _$RecipeContentFromJson(Map<String, dynamic> json) {
  return _ReceipeContent.fromJson(json);
}

/// @nodoc
mixin _$RecipeContent {
  RecipeContentDescription? get description =>
      throw _privateConstructorUsedError;
  RecipeContentDetails get details => throw _privateConstructorUsedError;
  List<String>? get preparationSteps => throw _privateConstructorUsedError;
  List<IngredientLines> get ingredientLines =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeContentCopyWith<RecipeContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeContentCopyWith<$Res> {
  factory $RecipeContentCopyWith(
          RecipeContent value, $Res Function(RecipeContent) then) =
      _$RecipeContentCopyWithImpl<$Res, RecipeContent>;
  @useResult
  $Res call(
      {RecipeContentDescription? description,
      RecipeContentDetails details,
      List<String>? preparationSteps,
      List<IngredientLines> ingredientLines});

  $RecipeContentDescriptionCopyWith<$Res>? get description;
  $RecipeContentDetailsCopyWith<$Res> get details;
}

/// @nodoc
class _$RecipeContentCopyWithImpl<$Res, $Val extends RecipeContent>
    implements $RecipeContentCopyWith<$Res> {
  _$RecipeContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = freezed,
    Object? details = null,
    Object? preparationSteps = freezed,
    Object? ingredientLines = null,
  }) {
    return _then(_value.copyWith(
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as RecipeContentDescription?,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as RecipeContentDetails,
      preparationSteps: freezed == preparationSteps
          ? _value.preparationSteps
          : preparationSteps // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      ingredientLines: null == ingredientLines
          ? _value.ingredientLines
          : ingredientLines // ignore: cast_nullable_to_non_nullable
              as List<IngredientLines>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RecipeContentDescriptionCopyWith<$Res>? get description {
    if (_value.description == null) {
      return null;
    }

    return $RecipeContentDescriptionCopyWith<$Res>(_value.description!,
        (value) {
      return _then(_value.copyWith(description: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RecipeContentDetailsCopyWith<$Res> get details {
    return $RecipeContentDetailsCopyWith<$Res>(_value.details, (value) {
      return _then(_value.copyWith(details: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ReceipeContentCopyWith<$Res>
    implements $RecipeContentCopyWith<$Res> {
  factory _$$_ReceipeContentCopyWith(
          _$_ReceipeContent value, $Res Function(_$_ReceipeContent) then) =
      __$$_ReceipeContentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RecipeContentDescription? description,
      RecipeContentDetails details,
      List<String>? preparationSteps,
      List<IngredientLines> ingredientLines});

  @override
  $RecipeContentDescriptionCopyWith<$Res>? get description;
  @override
  $RecipeContentDetailsCopyWith<$Res> get details;
}

/// @nodoc
class __$$_ReceipeContentCopyWithImpl<$Res>
    extends _$RecipeContentCopyWithImpl<$Res, _$_ReceipeContent>
    implements _$$_ReceipeContentCopyWith<$Res> {
  __$$_ReceipeContentCopyWithImpl(
      _$_ReceipeContent _value, $Res Function(_$_ReceipeContent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = freezed,
    Object? details = null,
    Object? preparationSteps = freezed,
    Object? ingredientLines = null,
  }) {
    return _then(_$_ReceipeContent(
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as RecipeContentDescription?,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as RecipeContentDetails,
      preparationSteps: freezed == preparationSteps
          ? _value._preparationSteps
          : preparationSteps // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      ingredientLines: null == ingredientLines
          ? _value._ingredientLines
          : ingredientLines // ignore: cast_nullable_to_non_nullable
              as List<IngredientLines>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReceipeContent implements _ReceipeContent {
  _$_ReceipeContent(
      {required this.description,
      required this.details,
      required final List<String>? preparationSteps,
      required final List<IngredientLines> ingredientLines})
      : _preparationSteps = preparationSteps,
        _ingredientLines = ingredientLines;

  factory _$_ReceipeContent.fromJson(Map<String, dynamic> json) =>
      _$$_ReceipeContentFromJson(json);

  @override
  final RecipeContentDescription? description;
  @override
  final RecipeContentDetails details;
  final List<String>? _preparationSteps;
  @override
  List<String>? get preparationSteps {
    final value = _preparationSteps;
    if (value == null) return null;
    if (_preparationSteps is EqualUnmodifiableListView)
      return _preparationSteps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<IngredientLines> _ingredientLines;
  @override
  List<IngredientLines> get ingredientLines {
    if (_ingredientLines is EqualUnmodifiableListView) return _ingredientLines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredientLines);
  }

  @override
  String toString() {
    return 'RecipeContent(description: $description, details: $details, preparationSteps: $preparationSteps, ingredientLines: $ingredientLines)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReceipeContent &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.details, details) || other.details == details) &&
            const DeepCollectionEquality()
                .equals(other._preparationSteps, _preparationSteps) &&
            const DeepCollectionEquality()
                .equals(other._ingredientLines, _ingredientLines));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      description,
      details,
      const DeepCollectionEquality().hash(_preparationSteps),
      const DeepCollectionEquality().hash(_ingredientLines));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReceipeContentCopyWith<_$_ReceipeContent> get copyWith =>
      __$$_ReceipeContentCopyWithImpl<_$_ReceipeContent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReceipeContentToJson(
      this,
    );
  }
}

abstract class _ReceipeContent implements RecipeContent {
  factory _ReceipeContent(
          {required final RecipeContentDescription? description,
          required final RecipeContentDetails details,
          required final List<String>? preparationSteps,
          required final List<IngredientLines> ingredientLines}) =
      _$_ReceipeContent;

  factory _ReceipeContent.fromJson(Map<String, dynamic> json) =
      _$_ReceipeContent.fromJson;

  @override
  RecipeContentDescription? get description;
  @override
  RecipeContentDetails get details;
  @override
  List<String>? get preparationSteps;
  @override
  List<IngredientLines> get ingredientLines;
  @override
  @JsonKey(ignore: true)
  _$$_ReceipeContentCopyWith<_$_ReceipeContent> get copyWith =>
      throw _privateConstructorUsedError;
}

RecipeContentDetails _$RecipeContentDetailsFromJson(Map<String, dynamic> json) {
  return _RecipeContentDetails.fromJson(json);
}

/// @nodoc
mixin _$RecipeContentDetails {
  int? get numberOfServings => throw _privateConstructorUsedError;
  String? get totalTime => throw _privateConstructorUsedError;
  List<RecipeImage> get images => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeContentDetailsCopyWith<RecipeContentDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeContentDetailsCopyWith<$Res> {
  factory $RecipeContentDetailsCopyWith(RecipeContentDetails value,
          $Res Function(RecipeContentDetails) then) =
      _$RecipeContentDetailsCopyWithImpl<$Res, RecipeContentDetails>;
  @useResult
  $Res call(
      {int? numberOfServings,
      String? totalTime,
      List<RecipeImage> images,
      String name,
      double rating});
}

/// @nodoc
class _$RecipeContentDetailsCopyWithImpl<$Res,
        $Val extends RecipeContentDetails>
    implements $RecipeContentDetailsCopyWith<$Res> {
  _$RecipeContentDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numberOfServings = freezed,
    Object? totalTime = freezed,
    Object? images = null,
    Object? name = null,
    Object? rating = null,
  }) {
    return _then(_value.copyWith(
      numberOfServings: freezed == numberOfServings
          ? _value.numberOfServings
          : numberOfServings // ignore: cast_nullable_to_non_nullable
              as int?,
      totalTime: freezed == totalTime
          ? _value.totalTime
          : totalTime // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<RecipeImage>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecipeContentDetailsCopyWith<$Res>
    implements $RecipeContentDetailsCopyWith<$Res> {
  factory _$$_RecipeContentDetailsCopyWith(_$_RecipeContentDetails value,
          $Res Function(_$_RecipeContentDetails) then) =
      __$$_RecipeContentDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? numberOfServings,
      String? totalTime,
      List<RecipeImage> images,
      String name,
      double rating});
}

/// @nodoc
class __$$_RecipeContentDetailsCopyWithImpl<$Res>
    extends _$RecipeContentDetailsCopyWithImpl<$Res, _$_RecipeContentDetails>
    implements _$$_RecipeContentDetailsCopyWith<$Res> {
  __$$_RecipeContentDetailsCopyWithImpl(_$_RecipeContentDetails _value,
      $Res Function(_$_RecipeContentDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numberOfServings = freezed,
    Object? totalTime = freezed,
    Object? images = null,
    Object? name = null,
    Object? rating = null,
  }) {
    return _then(_$_RecipeContentDetails(
      numberOfServings: freezed == numberOfServings
          ? _value.numberOfServings
          : numberOfServings // ignore: cast_nullable_to_non_nullable
              as int?,
      totalTime: freezed == totalTime
          ? _value.totalTime
          : totalTime // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<RecipeImage>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecipeContentDetails implements _RecipeContentDetails {
  _$_RecipeContentDetails(
      {required this.numberOfServings,
      required this.totalTime,
      required final List<RecipeImage> images,
      required this.name,
      required this.rating})
      : _images = images;

  factory _$_RecipeContentDetails.fromJson(Map<String, dynamic> json) =>
      _$$_RecipeContentDetailsFromJson(json);

  @override
  final int? numberOfServings;
  @override
  final String? totalTime;
  final List<RecipeImage> _images;
  @override
  List<RecipeImage> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final String name;
  @override
  final double rating;

  @override
  String toString() {
    return 'RecipeContentDetails(numberOfServings: $numberOfServings, totalTime: $totalTime, images: $images, name: $name, rating: $rating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecipeContentDetails &&
            (identical(other.numberOfServings, numberOfServings) ||
                other.numberOfServings == numberOfServings) &&
            (identical(other.totalTime, totalTime) ||
                other.totalTime == totalTime) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, numberOfServings, totalTime,
      const DeepCollectionEquality().hash(_images), name, rating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecipeContentDetailsCopyWith<_$_RecipeContentDetails> get copyWith =>
      __$$_RecipeContentDetailsCopyWithImpl<_$_RecipeContentDetails>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipeContentDetailsToJson(
      this,
    );
  }
}

abstract class _RecipeContentDetails implements RecipeContentDetails {
  factory _RecipeContentDetails(
      {required final int? numberOfServings,
      required final String? totalTime,
      required final List<RecipeImage> images,
      required final String name,
      required final double rating}) = _$_RecipeContentDetails;

  factory _RecipeContentDetails.fromJson(Map<String, dynamic> json) =
      _$_RecipeContentDetails.fromJson;

  @override
  int? get numberOfServings;
  @override
  String? get totalTime;
  @override
  List<RecipeImage> get images;
  @override
  String get name;
  @override
  double get rating;
  @override
  @JsonKey(ignore: true)
  _$$_RecipeContentDetailsCopyWith<_$_RecipeContentDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

RecipeImage _$RecipeImageFromJson(Map<String, dynamic> json) {
  return _RecipeImage.fromJson(json);
}

/// @nodoc
mixin _$RecipeImage {
  String get hostedLargeUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeImageCopyWith<RecipeImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeImageCopyWith<$Res> {
  factory $RecipeImageCopyWith(
          RecipeImage value, $Res Function(RecipeImage) then) =
      _$RecipeImageCopyWithImpl<$Res, RecipeImage>;
  @useResult
  $Res call({String hostedLargeUrl});
}

/// @nodoc
class _$RecipeImageCopyWithImpl<$Res, $Val extends RecipeImage>
    implements $RecipeImageCopyWith<$Res> {
  _$RecipeImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hostedLargeUrl = null,
  }) {
    return _then(_value.copyWith(
      hostedLargeUrl: null == hostedLargeUrl
          ? _value.hostedLargeUrl
          : hostedLargeUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecipeImageCopyWith<$Res>
    implements $RecipeImageCopyWith<$Res> {
  factory _$$_RecipeImageCopyWith(
          _$_RecipeImage value, $Res Function(_$_RecipeImage) then) =
      __$$_RecipeImageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String hostedLargeUrl});
}

/// @nodoc
class __$$_RecipeImageCopyWithImpl<$Res>
    extends _$RecipeImageCopyWithImpl<$Res, _$_RecipeImage>
    implements _$$_RecipeImageCopyWith<$Res> {
  __$$_RecipeImageCopyWithImpl(
      _$_RecipeImage _value, $Res Function(_$_RecipeImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hostedLargeUrl = null,
  }) {
    return _then(_$_RecipeImage(
      hostedLargeUrl: null == hostedLargeUrl
          ? _value.hostedLargeUrl
          : hostedLargeUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecipeImage implements _RecipeImage {
  _$_RecipeImage({required this.hostedLargeUrl});

  factory _$_RecipeImage.fromJson(Map<String, dynamic> json) =>
      _$$_RecipeImageFromJson(json);

  @override
  final String hostedLargeUrl;

  @override
  String toString() {
    return 'RecipeImage(hostedLargeUrl: $hostedLargeUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecipeImage &&
            (identical(other.hostedLargeUrl, hostedLargeUrl) ||
                other.hostedLargeUrl == hostedLargeUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, hostedLargeUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecipeImageCopyWith<_$_RecipeImage> get copyWith =>
      __$$_RecipeImageCopyWithImpl<_$_RecipeImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipeImageToJson(
      this,
    );
  }
}

abstract class _RecipeImage implements RecipeImage {
  factory _RecipeImage({required final String hostedLargeUrl}) = _$_RecipeImage;

  factory _RecipeImage.fromJson(Map<String, dynamic> json) =
      _$_RecipeImage.fromJson;

  @override
  String get hostedLargeUrl;
  @override
  @JsonKey(ignore: true)
  _$$_RecipeImageCopyWith<_$_RecipeImage> get copyWith =>
      throw _privateConstructorUsedError;
}

IngredientLines _$IngredientLinesFromJson(Map<String, dynamic> json) {
  return _IngredientLines.fromJson(json);
}

/// @nodoc
mixin _$IngredientLines {
  String? get unit => throw _privateConstructorUsedError;
  double? get quantity => throw _privateConstructorUsedError;
  String? get ingredient => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IngredientLinesCopyWith<IngredientLines> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientLinesCopyWith<$Res> {
  factory $IngredientLinesCopyWith(
          IngredientLines value, $Res Function(IngredientLines) then) =
      _$IngredientLinesCopyWithImpl<$Res, IngredientLines>;
  @useResult
  $Res call({String? unit, double? quantity, String? ingredient});
}

/// @nodoc
class _$IngredientLinesCopyWithImpl<$Res, $Val extends IngredientLines>
    implements $IngredientLinesCopyWith<$Res> {
  _$IngredientLinesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unit = freezed,
    Object? quantity = freezed,
    Object? ingredient = freezed,
  }) {
    return _then(_value.copyWith(
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double?,
      ingredient: freezed == ingredient
          ? _value.ingredient
          : ingredient // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IngredientLinesCopyWith<$Res>
    implements $IngredientLinesCopyWith<$Res> {
  factory _$$_IngredientLinesCopyWith(
          _$_IngredientLines value, $Res Function(_$_IngredientLines) then) =
      __$$_IngredientLinesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? unit, double? quantity, String? ingredient});
}

/// @nodoc
class __$$_IngredientLinesCopyWithImpl<$Res>
    extends _$IngredientLinesCopyWithImpl<$Res, _$_IngredientLines>
    implements _$$_IngredientLinesCopyWith<$Res> {
  __$$_IngredientLinesCopyWithImpl(
      _$_IngredientLines _value, $Res Function(_$_IngredientLines) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unit = freezed,
    Object? quantity = freezed,
    Object? ingredient = freezed,
  }) {
    return _then(_$_IngredientLines(
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double?,
      ingredient: freezed == ingredient
          ? _value.ingredient
          : ingredient // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IngredientLines implements _IngredientLines {
  _$_IngredientLines(
      {required this.unit, required this.quantity, required this.ingredient});

  factory _$_IngredientLines.fromJson(Map<String, dynamic> json) =>
      _$$_IngredientLinesFromJson(json);

  @override
  final String? unit;
  @override
  final double? quantity;
  @override
  final String? ingredient;

  @override
  String toString() {
    return 'IngredientLines(unit: $unit, quantity: $quantity, ingredient: $ingredient)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IngredientLines &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.ingredient, ingredient) ||
                other.ingredient == ingredient));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, unit, quantity, ingredient);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IngredientLinesCopyWith<_$_IngredientLines> get copyWith =>
      __$$_IngredientLinesCopyWithImpl<_$_IngredientLines>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IngredientLinesToJson(
      this,
    );
  }
}

abstract class _IngredientLines implements IngredientLines {
  factory _IngredientLines(
      {required final String? unit,
      required final double? quantity,
      required final String? ingredient}) = _$_IngredientLines;

  factory _IngredientLines.fromJson(Map<String, dynamic> json) =
      _$_IngredientLines.fromJson;

  @override
  String? get unit;
  @override
  double? get quantity;
  @override
  String? get ingredient;
  @override
  @JsonKey(ignore: true)
  _$$_IngredientLinesCopyWith<_$_IngredientLines> get copyWith =>
      throw _privateConstructorUsedError;
}

RecipeContentDescription _$RecipeContentDescriptionFromJson(
    Map<String, dynamic> json) {
  return _ReceipeContentDescription.fromJson(json);
}

/// @nodoc
mixin _$RecipeContentDescription {
  String? get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeContentDescriptionCopyWith<RecipeContentDescription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeContentDescriptionCopyWith<$Res> {
  factory $RecipeContentDescriptionCopyWith(RecipeContentDescription value,
          $Res Function(RecipeContentDescription) then) =
      _$RecipeContentDescriptionCopyWithImpl<$Res, RecipeContentDescription>;
  @useResult
  $Res call({String? text});
}

/// @nodoc
class _$RecipeContentDescriptionCopyWithImpl<$Res,
        $Val extends RecipeContentDescription>
    implements $RecipeContentDescriptionCopyWith<$Res> {
  _$RecipeContentDescriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReceipeContentDescriptionCopyWith<$Res>
    implements $RecipeContentDescriptionCopyWith<$Res> {
  factory _$$_ReceipeContentDescriptionCopyWith(
          _$_ReceipeContentDescription value,
          $Res Function(_$_ReceipeContentDescription) then) =
      __$$_ReceipeContentDescriptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? text});
}

/// @nodoc
class __$$_ReceipeContentDescriptionCopyWithImpl<$Res>
    extends _$RecipeContentDescriptionCopyWithImpl<$Res,
        _$_ReceipeContentDescription>
    implements _$$_ReceipeContentDescriptionCopyWith<$Res> {
  __$$_ReceipeContentDescriptionCopyWithImpl(
      _$_ReceipeContentDescription _value,
      $Res Function(_$_ReceipeContentDescription) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_$_ReceipeContentDescription(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReceipeContentDescription implements _ReceipeContentDescription {
  _$_ReceipeContentDescription({required this.text});

  factory _$_ReceipeContentDescription.fromJson(Map<String, dynamic> json) =>
      _$$_ReceipeContentDescriptionFromJson(json);

  @override
  final String? text;

  @override
  String toString() {
    return 'RecipeContentDescription(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReceipeContentDescription &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReceipeContentDescriptionCopyWith<_$_ReceipeContentDescription>
      get copyWith => __$$_ReceipeContentDescriptionCopyWithImpl<
          _$_ReceipeContentDescription>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReceipeContentDescriptionToJson(
      this,
    );
  }
}

abstract class _ReceipeContentDescription implements RecipeContentDescription {
  factory _ReceipeContentDescription({required final String? text}) =
      _$_ReceipeContentDescription;

  factory _ReceipeContentDescription.fromJson(Map<String, dynamic> json) =
      _$_ReceipeContentDescription.fromJson;

  @override
  String? get text;
  @override
  @JsonKey(ignore: true)
  _$$_ReceipeContentDescriptionCopyWith<_$_ReceipeContentDescription>
      get copyWith => throw _privateConstructorUsedError;
}
