import 'package:audio_player/models/models.dart';

abstract class FavoriteEvent {}

class AddToFavoritesSongsEvent extends FavoriteEvent {
  final SongModel songModel;

  AddToFavoritesSongsEvent(this.songModel);
}

class RemoveFromFavoritesSongsEvent extends FavoriteEvent {
  final SongModel songModel;

  RemoveFromFavoritesSongsEvent(this.songModel);
}

class AddToFavoritesAlbumsEvent extends FavoriteEvent {
  final SongModel songModel;

  AddToFavoritesAlbumsEvent(this.songModel);
}

class RemoveFromFavoritesAlbumsEvent extends FavoriteEvent {
  final SongModel songModel;

  RemoveFromFavoritesAlbumsEvent(this.songModel);
}

class CheckFavoriteStatusEvent extends FavoriteEvent {
  final String songId;

  CheckFavoriteStatusEvent(this.songId);
}
