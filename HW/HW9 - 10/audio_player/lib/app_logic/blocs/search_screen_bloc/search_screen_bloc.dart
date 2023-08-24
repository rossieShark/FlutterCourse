import 'package:audio_player/app_logic/blocs/search_screen_bloc/search_state.dart';
import 'package:audio_player/app_logic/blocs/search_screen_bloc/serch_event.dart';
import 'package:audio_player/models/search_result/search_result_model.dart';
import 'package:audio_player/services/search_result/search_result_pagination.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultBloc extends Bloc<SearchResultEvent, SearchResultState> {
  final SearchRepository repository;

  SearchResultBloc(this.repository) : super(SearchResultState([])) {
    on<FetchSearchResultEvent>(_fetchAlbumDetail);
  }

  void _fetchAlbumDetail(
      FetchSearchResultEvent event, Emitter<SearchResultState> emit) async {
    try {
      final albumDetails = await repository.getAlbums(event.q);
      emit(SearchResultState(albumDetails));
      // print('Fetched album detail: $albumDetails');

      print('Emitted album detail state');
    } catch (error) {
      print('Error fetching album detail: $error');
    }
  }

  // Stream<SearchResultState> mapEventToState(SearchResultEvent event) async* {
  //   if (event is FetchSearchResultEvent) {
  //     try {
  //       final searchResultList = await repository.getAlbums(event.q);
  //       yield SearchResultState(searchResultList);
  //     } catch (error) {
  //       print('Error fetching song detail: $error');
  //     }
  //   }
  // }
}

class SearchRepository {
  final SearchResultPaginationService _service =
      SearchResultPaginationService();

  Future<List<Hits>> getAlbums(String q) async {
    await _service.loadMoreItems(q);
    return _service.items;
  }
}
