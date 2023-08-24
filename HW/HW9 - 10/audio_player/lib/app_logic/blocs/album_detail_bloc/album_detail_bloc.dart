import 'package:audio_player/app_logic/blocs/album_detail_bloc/album_detail_event.dart';
import 'package:audio_player/app_logic/blocs/album_detail_bloc/album_detail_state.dart';
import 'package:audio_player/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumDetailBloc extends Bloc<AlbumDetailBlocEvent, AlbumDetailBlocState> {
  final AlbumDetailsRepository repository;

  AlbumDetailBloc(this.repository) : super(AlbumDetailBlocState([])) {
    on<FetchAlbumDetailBlocEvent>(_fetchAlbumDetail);
  }

  void _fetchAlbumDetail(FetchAlbumDetailBlocEvent event,
      Emitter<AlbumDetailBlocState> emit) async {
    try {
      final albumDetail = await repository.getDetailAlbums(event.id);
      // print('Fetched album detail: $albumDetail');
      emit(AlbumDetailBlocState(albumDetail));
      print('Emitted album detail state');
    } catch (error) {
      print('Error fetching album detail: $error');
    }
  }
}
