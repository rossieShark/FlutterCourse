abstract class DetailMusicPageEvent {}

class FetchSongDetailEvent extends DetailMusicPageEvent {
  final String id;

  FetchSongDetailEvent(this.id);
}
