import 'package:audio_player/app_logic/blocs/detail_music_bloc/detail_music_event.dart';
import 'package:audio_player/app_logic/blocs/detail_music_bloc/detail_music_state.dart';
import 'package:audio_player/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
