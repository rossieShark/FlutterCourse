import 'package:freezed_annotation/freezed_annotation.dart';
part 'serch_event.freezed.dart';
part 'serch_event.g.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.textChanged({required String newText}) =
      TextChangedSearchEvent;

  const factory SearchEvent.loadSearchResults({required String newText}) =
      LoadSearchEvent;
  const factory SearchEvent.loadMoreItems({required String text}) =
      LoadMoreItemsSearchEvent;

  factory SearchEvent.fromJson(Map<String, Object?> json) =>
      _$SearchEventFromJson(json);
}
