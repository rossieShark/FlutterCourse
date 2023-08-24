// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'recently_played_model.freezed.dart';
part 'recently_played_model.g.dart';

@freezed
class RecentlyPlayedResponse with _$RecentlyPlayedResponse {
  factory RecentlyPlayedResponse({
    @JsonKey(name: 'chart_items') required List<RecentlyPlayedlist> charItems,
  }) = _RecentlyPlayedResponse;
  static const fromJsonFactory = _$RecentlyPlayedResponseFromJson;
  factory RecentlyPlayedResponse.fromJson(Map<String, Object?> json) =>
      _$RecentlyPlayedResponseFromJson(json);
}

@freezed
class RecentlyPlayedlist with _$RecentlyPlayedlist {
  factory RecentlyPlayedlist({required Item item}) = _RecentlyPlayedlist;

  factory RecentlyPlayedlist.fromJson(Map<String, Object?> json) =>
      _$RecentlyPlayedlistFromJson(json);
}

@freezed
class Item with _$Item {
  factory Item(
      {@JsonKey(name: 'artist_names') required String? artistNames,
      required String? title,
      @JsonKey(name: 'header_image_url') required String? imageUrl,
      required int id}) = _Item;

  factory Item.fromJson(Map<String, Object?> json) => _$ItemFromJson(json);
}
