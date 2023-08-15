import 'package:audio_player/models/models.dart';
import 'package:audio_player/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AlbumDetailBlocEvent {}

class FetchAlbumDetailBlocEvent extends AlbumDetailBlocEvent {
  final String id;

  FetchAlbumDetailBlocEvent(this.id);
}

class AlbumDetailBlocState {
  final List<AlbumAppearances> albumDetailList;

  AlbumDetailBlocState(this.albumDetailList);
}

class AlbumDetailBloc extends Bloc<AlbumDetailBlocEvent, AlbumDetailBlocState> {
  final AlbumDetailsRepository repository;

  AlbumDetailBloc(this.repository) : super(AlbumDetailBlocState([])) {
    on<FetchAlbumDetailBlocEvent>(_fetchAlbumDetail);
  }

  void _fetchAlbumDetail(FetchAlbumDetailBlocEvent event,
      Emitter<AlbumDetailBlocState> emit) async {
    try {
      final albumDetail = await repository.getAlbumSongsList(event.id);
      print('Fetched album detail: $albumDetail');
      emit(AlbumDetailBlocState(albumDetail));
      print('Emitted album detail state');
    } catch (error) {
      print('Error fetching album detail: $error');
    }
  }
}
