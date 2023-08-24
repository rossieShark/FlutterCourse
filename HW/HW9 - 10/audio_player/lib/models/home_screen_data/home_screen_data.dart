// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_screen_data.freezed.dart';
part 'home_screen_data.g.dart';

@freezed
class BestAlbumsResponse with _$BestAlbumsResponse {
  factory BestAlbumsResponse({
    @JsonKey(name: 'chart_items') required List<BestAlbumsList> chartItems,
  }) = _BestAlbumsResponse;
  static const fromJsonFactory = _$BestAlbumsResponseFromJson;
  factory BestAlbumsResponse.fromJson(Map<String, Object?> json) =>
      _$BestAlbumsResponseFromJson(json);
}

@freezed
class BestAlbumsList with _$BestAlbumsList {
  factory BestAlbumsList({required Item item}) = _BestAlbumsList;

  factory BestAlbumsList.fromJson(Map<String, Object?> json) =>
      _$BestAlbumsListFromJson(json);
}

@freezed
class Item with _$Item {
  factory Item(
      {@JsonKey(name: 'cover_art_url') required String? coverImage,
      @JsonKey(name: 'release_date_for_display') required String? releaseDate,
      @JsonKey(name: 'full_title') required String? fullTitle,
      required int id}) = _Item;

  factory Item.fromJson(Map<String, Object?> json) => _$ItemFromJson(json);
}
