import 'dart:async';
import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/models/models.dart';
import 'package:audio_player/services/services.dart';

class SearchResultBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository repository;

  Timer? _loadResultsTimer;
  SearchResultBloc(this.repository) : super(const SearchState.empty()) {
    on<TextChangedSearchEvent>(_onSearchTextChanged);
    on<LoadSearchEvent>(_onLoadSearchResults);
    on<LoadMoreItemsSearchEvent>(_onSearchLoadMoreItems);
  }

  Future<void> _onSearchTextChanged(
      TextChangedSearchEvent event, Emitter<SearchState> emit) async {
    _loadResultsTimer?.cancel();
    _loadResultsTimer = Timer(const Duration(seconds: 1), () {
      add(SearchEvent.loadSearchResults(newText: event.newText));
    });
  }

  Future<void> _onLoadSearchResults(
      LoadSearchEvent event, Emitter<SearchState> emit) async {
    if (event.newText.isEmpty) {
      emit(const SearchState.empty());
      return;
    }
    emit(const SearchState.loading());
    final albumDetails = await repository.getAlbums(event.newText);
    if (albumDetails.isEmpty) {
      emit(const SearchState.noResults());
      return;
    }
    emit(SearchState.loaded(data: albumDetails));
  }

  Future<void> _onSearchLoadMoreItems(
      LoadMoreItemsSearchEvent event, Emitter<SearchState> emit) async {
    final albumDetails = await repository.getAlbums(event.text);
    emit(SearchState.loaded(data: albumDetails));
  }
}

class SearchRepository {
  final SearchResultPaginationService _service =
      SearchResultPaginationService();

  Future<List<SearchData>> getAlbums(String q) async {
    await _service.loadMoreItems(q);
    return _service.items;
  }
}
