abstract class AlbumEvent {}

class FetchAlbumsEvent extends AlbumEvent {}

class RefreshAlbumsEvent extends AlbumEvent {}

abstract class FavoriteArtistEvent {}

class FetchFavoriteArtistsEvent extends FavoriteArtistEvent {}

abstract class RecentlyPlayedBlocEvent {}

class FetchRecentlyPlayedEvent extends RecentlyPlayedBlocEvent {}
