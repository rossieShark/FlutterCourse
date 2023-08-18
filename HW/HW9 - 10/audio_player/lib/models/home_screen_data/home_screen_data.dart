import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_screen_data.freezed.dart';
part 'home_screen_data.g.dart';

@freezed
class TracksResponce with _$TracksResponce {
  factory TracksResponce({
    required List<ChartItems> chart_items,
  }) = _TracksResponce;
  static const fromJsonFactory = _$TracksResponceFromJson;
  factory TracksResponce.fromJson(Map<String, Object?> json) =>
      _$TracksResponceFromJson(json);
}

@freezed
class ChartItems with _$ChartItems {
  factory ChartItems({required Item item}) = _ChartItems;

  factory ChartItems.fromJson(Map<String, Object?> json) =>
      _$ChartItemsFromJson(json);
}

@freezed
class Item with _$Item {
  factory Item(
      {required String? artist_names,
      required String? name,
      required String? title,
      required String? header_image_url,
      required String? cover_art_url,
      required String? release_date_for_display,
      required String? full_title,
      required String? image_url,
      required int id}) = _Item;

  factory Item.fromJson(Map<String, Object?> json) => _$ItemFromJson(json);
}
