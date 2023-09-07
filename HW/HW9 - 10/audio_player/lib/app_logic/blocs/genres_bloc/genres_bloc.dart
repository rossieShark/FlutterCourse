import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/services/services.dart';

class GenresBloc extends Bloc<GenresEvent, GenresState> {
  final GenresRepository repository;

  GenresBloc(this.repository) : super(GenresState([])) {
    on<FetchGenresEvent>(fetchGenres);
  }

  void fetchGenres(FetchGenresEvent event, Emitter<GenresState> emit) async {
    try {
      final genres = await repository.getTracksFromDb();
      emit(GenresState(genres));
    } catch (error) {
      print('Error fetching song detail: $error');
    }
  }
}
