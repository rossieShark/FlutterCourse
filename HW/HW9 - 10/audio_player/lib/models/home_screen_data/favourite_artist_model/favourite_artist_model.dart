// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'favourite_artist_model.freezed.dart';
part 'favourite_artist_model.g.dart';

@freezed
class FavouriteArtistResponse with _$FavouriteArtistResponse {
  factory FavouriteArtistResponse({
    @JsonKey(name: 'chart_items') required List<Artists> chartItems,
  }) = _FavouriteArtistResponse;
  static const fromJsonFactory = _$FavouriteArtistResponseFromJson;
  factory FavouriteArtistResponse.fromJson(Map<String, Object?> json) =>
      _$FavouriteArtistResponseFromJson(json);
}

@freezed
class Artists with _$Artists {
  factory Artists({required Item item}) = _Artists;

  factory Artists.fromJson(Map<String, Object?> json) =>
      _$ArtistsFromJson(json);
}

@freezed
class Item with _$Item {
  factory Item(
      {required String? name,
      @JsonKey(name: 'image_url') required String? imageUrl,
      required int id}) = _Item;

  factory Item.fromJson(Map<String, Object?> json) => _$ItemFromJson(json);
}
