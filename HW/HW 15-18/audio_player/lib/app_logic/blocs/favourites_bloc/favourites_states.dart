abstract class FavoriteState {}

class FavoriteInitialState extends FavoriteState {}

class FavoriteSongUpdatedState extends FavoriteState {
  final bool isFavorite;

  FavoriteSongUpdatedState(this.isFavorite);
}

class FavoriteAlbumUpdatedState extends FavoriteState {
  final bool isFavorite;

  FavoriteAlbumUpdatedState(this.isFavorite);
}
