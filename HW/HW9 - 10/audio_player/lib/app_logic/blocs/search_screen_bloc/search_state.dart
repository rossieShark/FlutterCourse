import 'package:audio_player/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'search_state.freezed.dart';
part 'search_state.g.dart';

@Freezed(equal: false)
class SearchState with _$SearchState {
  const factory SearchState.empty() = EmptySearchState;
  const factory SearchState.loading() = LoadingSearchState;
  const factory SearchState.noResults() = NoResultsSearchState;
  const factory SearchState.loaded({required List<SearchData> data}) =
      LoadedSearchState;
  factory SearchState.fromJson(Map<String, Object?> json) =>
      _$SearchStateFromJson(json);
}
