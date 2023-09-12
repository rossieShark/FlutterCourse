import 'package:drift/drift.dart';

@DataClassName('RecentlyPlayedSong')
class RecentlyPlayedSongs extends Table {
  IntColumn get id => integer().customConstraint('NOT NULL')();
  TextColumn get artistNames => text()();
  TextColumn get title => text()();
  TextColumn get headerImageUrl => text()();
  TextColumn get type => text()();
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('FavoriteArtist')
class FavoriteArtists extends Table {
  IntColumn get id => integer().customConstraint('NOT NULL')();
  TextColumn get name => text()();
  TextColumn get image => text()();
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('BestAlbum')
class BestAlbums extends Table {
  IntColumn get id => integer().customConstraint('NOT NULL')();
  TextColumn get title => text()();
  TextColumn get image => text()();
  TextColumn get artist => text()();
  TextColumn get type => text()();
  IntColumn get detailAlbum => integer()();
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('DetailAlbum')
class DetailAlbums extends Table {
  IntColumn get id => integer().customConstraint('NOT NULL')();
  IntColumn get albumid => integer()();
  TextColumn get artistNames => text()();
  TextColumn get type => text()();

  TextColumn get title => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('FavoriteSong')
class FavoriteSongs extends Table {
  IntColumn get id => integer().customConstraint('NOT NULL')();
  TextColumn get title => text()();
  TextColumn get artist => text()();
  TextColumn get songImage => text()();
  TextColumn get type => text()();
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('FavoriteAlbum')
class FavoriteAlbums extends Table {
  IntColumn get id => integer().customConstraint('NOT NULL')();
  TextColumn get title => text()();
  TextColumn get artist => text()();
  TextColumn get songImage => text()();
  TextColumn get type => text()();
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('RecentlySearchedSong')
class RecentlySearchedSongs extends Table {
  IntColumn get id => integer().customConstraint('NOT NULL')();
  TextColumn get title => text()();
  TextColumn get artist => text()();
  TextColumn get type => text()();
  TextColumn get songImage => text()();
  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('DetailInfoSong')
class DetailInfoSongs extends Table {
  IntColumn get id => integer().customConstraint('NOT NULL')();
  TextColumn get title => text()();
  TextColumn get artistNames => text()();
  TextColumn get imageUrl => text()();
  TextColumn get preview => text()();
  TextColumn get type => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class MusicGenres extends Table {
  TextColumn get id => text().customConstraint('NOT NULL')();
  TextColumn get name => text()();
  TextColumn get image => text()();

  @override
  Set<Column> get primaryKey => {id};
}
