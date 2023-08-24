import 'package:audio_player/databases/connection/connection.dart' as impl;
import 'package:audio_player/databases/tables.dart';
import 'package:drift/drift.dart';

part 'database.g.dart';

@DriftDatabase(tables: [
  RecentlyPlayedSongs,
  FavoriteArtists,
  BestAlbums,
  DetailAlbums,
  FavoriteAlbums,
  FavoriteSongs,
  RecentlySearchedSongs
])
class AudioDatabase extends _$AudioDatabase {
  AudioDatabase() : super(impl.connect());

  @override
  int get schemaVersion => 1;

//GET METHODS
  Future<List<RecentlyPlayedSong>> get allRecentlyPlayedSongs =>
      select(recentlyPlayedSongs).get();

  Future<List<FavoriteArtist>> get allFavouriteArtists =>
      select(favoriteArtists).get();

  Future<List<BestAlbum>> get allBestAlbums => select(bestAlbums).get();

  Future<List<DetailAlbum>> get AllDetailAlbums => select(detailAlbums).get();

  Future<void> addDetailAlbum(DetailAlbum detailAlbum) =>
      into(detailAlbums).insert(detailAlbum);

  Stream<List<DetailAlbum>> watchInfoInDetailAlbum(int id) {
    return (select(detailAlbums)..where((t) => t.albumid.equals(id))).watch();
  }

  //SORT METHODS
  Future<List<RecentlyPlayedSong>> sortTitlesAlphabetically() {
    return (select(recentlyPlayedSongs)
          ..orderBy([(t) => OrderingTerm(expression: t.title)]))
        .get();
  }

  Future<List<RecentlyPlayedSong>> sortArtistNamesAlphabetically() {
    return (select(recentlyPlayedSongs)
          ..orderBy([(t) => OrderingTerm(expression: t.artistNames)]))
        .get();
  }

  Future<List<FavoriteSong>> getFavoriteSongs() => select(favoriteSongs).get();

  Future<void> insertFavoriteSong(FavoriteSong song) =>
      into(favoriteSongs).insert(song, mode: InsertMode.replace);

  Future<void> deleteFavoriteSong(int songId) =>
      (delete(favoriteSongs)..where((song) => song.id.equals(songId))).go();

  Future<List<FavoriteAlbum>> getFavoriteAlbums() =>
      select(favoriteAlbums).get();

  Future<void> insertFavoritAlbum(FavoriteAlbum song) =>
      into(favoriteAlbums).insert(song, mode: InsertMode.replace);

  Future<void> deleteFavoriteAlbum(int songId) =>
      (delete(favoriteAlbums)..where((song) => song.id.equals(songId))).go();
  Future<List<RecentlySearchedSong>> getRecentlySearchedSongs() =>
      select(recentlySearchedSongs).get();
  Future<void> insertRecentlySearched(RecentlySearchedSong song) =>
      into(recentlySearchedSongs).insert(song, mode: InsertMode.replace);

  Future<void> clearAll() => delete(recentlySearchedSongs).go();

//ADD METHODS
  Future<void> addSongItem(RecentlyPlayedSong recentlyPlayedSong) {
    return into(recentlyPlayedSongs).insert(recentlyPlayedSong);
  }

  Future<void> addManySongs(List<RecentlyPlayedSong> items) async {
    await batch((batch) {
      batch.insertAll(recentlyPlayedSongs, items);
    });
  }

  Future<void> addManyAlbums(List<BestAlbum> items) async {
    await batch((batch) {
      batch.insertAll(bestAlbums, items);
    });
  }

  Future<void> addManyFavoriteArtists(List<FavoriteArtist> items) async {
    await batch((batch) {
      batch.insertAll(favoriteArtists, items);
    });
  }

  Future<void> addManyDetailAlbums(List<DetailAlbum> items) async {
    await batch((batch) {
      batch.insertAll(detailAlbums, items);
    });
  }

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(onCreate: (Migrator m) async {
      await m.createAll();
    }, onUpgrade: (Migrator m, int from, int to) async {
      if (from < 2) {}
      if (from < 3) {}
    });
  }
}
