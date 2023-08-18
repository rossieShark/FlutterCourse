import 'package:audio_player/models/models.dart';
import 'package:audio_player/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class DetailMusicPageEvent {}

class FetchSongDetailEvent extends DetailMusicPageEvent {
  final String id;

  FetchSongDetailEvent(this.id);
}

class DetailMusicPageState {
  final SongDetail? songDetail;

  DetailMusicPageState(this.songDetail);
}

class DetailMusicPageBloc
    extends Bloc<DetailMusicPageEvent, DetailMusicPageState> {
  final SongDetailRepository repository;

  DetailMusicPageBloc(this.repository) : super(DetailMusicPageState(null)) {
    on<FetchSongDetailEvent>(_fetchSongDetail);
  }

  void _fetchSongDetail(
      FetchSongDetailEvent event, Emitter<DetailMusicPageState> emit) async {
    try {
      final songDetail = await repository.getSongInfo(event.id);
      emit(DetailMusicPageState(songDetail));
    } catch (error) {
      print('Error fetching song detail: $error');
    }
  }
}
