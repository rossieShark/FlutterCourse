abstract class AlbumDetailBlocEvent {}

class FetchAlbumDetailBlocEvent extends AlbumDetailBlocEvent {
  final String id;

  FetchAlbumDetailBlocEvent(this.id);
}
