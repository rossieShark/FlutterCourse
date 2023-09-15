import 'package:project/app_logic/blocs/bloc_exports.dart';
import 'package:project/services/services.dart';

class AlbumDetailBloc extends Bloc<AlbumDetailBlocEvent, AlbumDetailBlocState> {
  final AlbumDetailsRepository repository;

  AlbumDetailBloc(this.repository) : super(AlbumDetailBlocState([])) {
    on<FetchAlbumDetailBlocEvent>(_fetchAlbumDetail);
  }

  void _fetchAlbumDetail(FetchAlbumDetailBlocEvent event,
      Emitter<AlbumDetailBlocState> emit) async {
    try {
      final albumDetail = await repository.getDetailAlbums(event.id);

      emit(AlbumDetailBlocState(albumDetail));
      print('Emitted album detail state');
    } catch (error) {
      print('Error fetching album detail: $error');
    }
  }
}
