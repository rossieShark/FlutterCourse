import 'package:audio_player/app_logic/blocs/bloc_exports.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteProvider favoriteProvider;

  FavoriteBloc(this.favoriteProvider) : super(FavoriteInitialState()) {
    on<AddToFavoritesSongsEvent>(_onAddSongToFavorites);
    on<RemoveFromFavoritesSongsEvent>(_onRemoveSongFromFavorites);
    on<AddToFavoritesAlbumsEvent>(_onAddAlbumToFavorites);
    on<RemoveFromFavoritesAlbumsEvent>(_onRemoveAlbumFromFavorites);
    on<CheckFavoriteStatusEvent>(_onCheckFavoriteStatus);
  }

  void _onAddSongToFavorites(
      AddToFavoritesSongsEvent event, Emitter<FavoriteState> emit) {
    favoriteProvider.addToFavorites(event.songModel);
    emit(FavoriteAddedState());
  }

  void _onRemoveSongFromFavorites(
      RemoveFromFavoritesSongsEvent event, Emitter<FavoriteState> emit) {
    favoriteProvider.removeFromFavorites(event.songModel);
    emit(FavoriteRemovedState());
  }

  void _onAddAlbumToFavorites(
      AddToFavoritesAlbumsEvent event, Emitter<FavoriteState> emit) {
    favoriteProvider.addToFavoritesAlbum(event.songModel);
    emit(FavoriteAddedState());
  }

  void _onRemoveAlbumFromFavorites(
      RemoveFromFavoritesAlbumsEvent event, Emitter<FavoriteState> emit) {
    favoriteProvider.removeFromFavorites(event.songModel);
    emit(FavoriteRemovedState());
  }

  void _onCheckFavoriteStatus(
      CheckFavoriteStatusEvent event, Emitter<FavoriteState> emit) {
    final isFavorite = favoriteProvider.contains(event.songId);
    emit(FavoriteStatusState(isFavorite));
  }
}
