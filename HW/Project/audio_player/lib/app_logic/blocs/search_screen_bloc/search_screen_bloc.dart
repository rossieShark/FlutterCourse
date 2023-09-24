import 'dart:async';
import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/models/models.dart';
import 'package:audio_player/services/services.dart';

class SearchResultBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository repository;

  Timer? loadResultsTimer;
  SearchResultBloc(this.repository) : super(const SearchState.empty()) {
    on<TextChangedSearchEvent>(onSearchTextChanged);
    on<LoadSearchEvent>(onLoadSearchResults);
    on<LoadMoreItemsSearchEvent>(_onSearchLoadMoreItems);
  }

  Future<void> onSearchTextChanged(
      TextChangedSearchEvent event, Emitter<SearchState> emit) async {
    loadResultsTimer?.cancel();
    loadResultsTimer = Timer(const Duration(seconds: 1), () {
      add(SearchEvent.loadSearchResults(newText: event.newText));
    });
  }

  Future<void> onLoadSearchResults(
      LoadSearchEvent event, Emitter<SearchState> emit) async {
    if (event.newText.isEmpty) {
      emit(const SearchState.empty());
      return;
    }
    emit(const SearchState.loading());
    final albumDetails = await repository.getSearchResult(event.newText);
    if (albumDetails.isEmpty) {
      emit(const SearchState.noResults());
      return;
    }
    emit(SearchState.loaded(data: albumDetails));
  }

  Future<void> _onSearchLoadMoreItems(
      LoadMoreItemsSearchEvent event, Emitter<SearchState> emit) async {
    final albumDetails = await repository.getSearchResult(event.text);
    emit(SearchState.loaded(data: albumDetails));
  }
}

class SearchRepository {
  final SearchResultPaginationService _service;
  SearchRepository(this._service);
  Future<List<SearchData>> getSearchResult(String q) async {
    await _service.loadMoreItems(q);
    return _service.items;
  }
}
