import 'package:audio_player/app_logic/blocs/bloc_exports.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteProvider favoriteProvider;

  FavoriteBloc(this.favoriteProvider) : super(FavoriteSongUpdatedState(false)) {
    on<ToggleFavoriteSongEvent>(_onToggleSongFavorite);
    on<ToggleFavoriteAlbumEvent>(_onToggleAlbumFavorite);
  }

  void _onToggleSongFavorite(
      ToggleFavoriteSongEvent event, Emitter<FavoriteState> emit) {
    final isFavorite = favoriteProvider.isFavoriteSong(event.songModel.id);

    if (isFavorite) {
      favoriteProvider.removeFromFavorites(event.songModel);
    } else {
      favoriteProvider.addToFavorites(event.songModel);
    }
    emit(FavoriteSongUpdatedState(!isFavorite));
  }

  void _onToggleAlbumFavorite(
      ToggleFavoriteAlbumEvent event, Emitter<FavoriteState> emit) {
    final isFavorite = favoriteProvider.isFavoriteAlbum(event.songModel.id);

    if (isFavorite) {
      favoriteProvider.removeFromFavoritesAlbum(event.songModel);
    } else {
      favoriteProvider.addToFavoritesAlbum(event.songModel);
    }
    emit(FavoriteSongUpdatedState(!isFavorite));
  }
}
