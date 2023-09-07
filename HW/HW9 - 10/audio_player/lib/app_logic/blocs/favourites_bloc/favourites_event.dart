import 'package:audio_player/models/models.dart';

abstract class FavoriteEvent {}

class ToggleFavoriteSongEvent extends FavoriteEvent {
  final SongModel songModel;

  ToggleFavoriteSongEvent(this.songModel);
}

class ToggleFavoriteAlbumEvent extends FavoriteEvent {
  final SongModel songModel;

  ToggleFavoriteAlbumEvent(this.songModel);
}
