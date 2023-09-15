import 'package:project/databases/database.dart';

class AlbumState {
  final List<BestAlbum> feed;

  AlbumState(this.feed);
}

class FavoriteArtistState {
  final List<FavoriteArtist> favoriteArtistList;

  FavoriteArtistState(this.favoriteArtistList);
}

class RecentlyPlayedBlocState {
  final List<RecentlyPlayedSong> recentlyPlayedtList;

  RecentlyPlayedBlocState(this.recentlyPlayedtList);
}
