// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'favourite_artist_model.freezed.dart';
part 'favourite_artist_model.g.dart';

@freezed
class FavouriteArtistResponse with _$FavouriteArtistResponse {
  factory FavouriteArtistResponse({
    required List<Artists> data,
  }) = _FavouriteArtistResponse;
  static const fromJsonFactory = _$FavouriteArtistResponseFromJson;
  factory FavouriteArtistResponse.fromJson(Map<String, Object?> json) =>
      _$FavouriteArtistResponseFromJson(json);
}

@freezed
class Artists with _$Artists {
  factory Artists(
      {required int id,
      required String name,
      @JsonKey(name: 'picture_big') required String image}) = _Artists;

  factory Artists.fromJson(Map<String, Object?> json) =>
      _$ArtistsFromJson(json);
}
