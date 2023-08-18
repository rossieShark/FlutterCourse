import 'package:audio_player/models/genres_model/genres_model.dart';
import 'package:audio_player/services/genres_service/genres_repo.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class GenresEvent {}

class FetchGenresEvent extends GenresEvent {}

class GenresState {
  final List<Items> items;

  GenresState(this.items);
}

class GenresBloc extends Bloc<GenresEvent, GenresState> {
  final GenresRepository repository;

  GenresBloc(this.repository) : super(GenresState([])) {
    on<FetchGenresEvent>(_fetchGenres);
  }

  void _fetchGenres(FetchGenresEvent event, Emitter<GenresState> emit) async {
    try {
      final genres = await repository.getGenres();
      emit(GenresState(genres));
    } catch (error) {
      print('Error fetching song detail: $error');
    }
  }
}
