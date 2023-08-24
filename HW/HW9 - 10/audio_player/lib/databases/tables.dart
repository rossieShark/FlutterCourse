import 'package:drift/drift.dart';

@DataClassName('RecentlyPlayedSong')
class RecentlyPlayedSongs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get artistNames => text()();
  TextColumn get title => text()();
  TextColumn get headerImageUrl => text()();
}

@DataClassName('FavoriteArtist')
class FavoriteArtists extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get image => text()();
}

@DataClassName('BestAlbum')
class BestAlbums extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get image => text()();
  TextColumn get releaseDate => text()();
  IntColumn get detailAlbum => integer()();
}

@DataClassName('DetailAlbum')
class DetailAlbums extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get albumid => integer()();
  TextColumn get artistNames => text()();
  TextColumn get headerImageUrl => text()();
  TextColumn get title => text()();
  TextColumn get songImage => text()();
  TextColumn get releaseDate => text()();
}

@DataClassName('FavoriteSong')
class FavoriteSongs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get artist => text()();
  TextColumn get songImage => text()();
}

@DataClassName('FavoriteAlbum')
class FavoriteAlbums extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get artist => text()();
  TextColumn get songImage => text()();
}

@DataClassName('RecentlySearchedSong')
class RecentlySearchedSongs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get artist => text()();
  TextColumn get songImage => text()();
}
