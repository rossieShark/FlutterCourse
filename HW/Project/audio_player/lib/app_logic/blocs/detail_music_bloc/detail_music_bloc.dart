import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/services/services.dart';

class DetailMusicPageBloc
    extends Bloc<DetailMusicPageEvent, DetailMusicPageState> {
  final SongDetailRepository repository;

  DetailMusicPageBloc(this.repository) : super(DetailMusicPageState(null)) {
    on<FetchSongDetailEvent>(_fetchSongDetail);
  }

  void _fetchSongDetail(
      FetchSongDetailEvent event, Emitter<DetailMusicPageState> emit) async {
    try {
      final songDetail = await repository.getDetailSongInfo(event.id);
      emit(DetailMusicPageState(songDetail));
    } catch (error) {
      print('Error fetching song detail: $error');
    }
  }
}
