abstract class FavoriteState {}

class FavoriteInitialState extends FavoriteState {}

class FavoriteAddedState extends FavoriteState {}

class FavoriteRemovedState extends FavoriteState {}

class FavoriteStatusState extends FavoriteState {
  final bool isFavorite;

  FavoriteStatusState(this.isFavorite);
}
