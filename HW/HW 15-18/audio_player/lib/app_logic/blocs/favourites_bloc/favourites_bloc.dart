import 'package:audio_player/app_logic/blocs/bloc_exports.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteProvider favoriteProvider;

  FavoriteBloc(this.favoriteProvider) : super(FavoriteSongUpdatedState(false)) {
    on<ToggleFavoriteSongEvent>(_onToggleSongFavorite);
    on<ToggleFavoriteAlbumEvent>(_onToggleAlbumFavorite);
  }

  void _onToggleSongFavorite(
      ToggleFavoriteSongEvent event, Emitter<FavoriteState> emit) async {
    final isFavorite = favoriteProvider.isFavoriteSong(event.songModel.id);

    if (isFavorite) {
      await favoriteProvider.removeFromFavorites(event.songModel);
    } else {
      await favoriteProvider.addToFavorites(event.songModel);
    }
    emit(FavoriteSongUpdatedState(!isFavorite));
  }

  void _onToggleAlbumFavorite(
      ToggleFavoriteAlbumEvent event, Emitter<FavoriteState> emit) async {
    final isFavorite = favoriteProvider.isFavoriteAlbum(event.songModel.id);

    if (isFavorite) {
      await favoriteProvider.removeFromFavoritesAlbum(event.songModel);
    } else {
      await favoriteProvider.addToFavoritesAlbum(event.songModel);
    }
    emit(FavoriteAlbumUpdatedState(!isFavorite));
  }
}
