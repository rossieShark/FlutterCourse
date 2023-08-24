import 'package:audio_player/databases/database.dart';

import 'package:audio_player/models/models.dart';
import 'package:audio_player/services/services.dart';

class AlbumDetailsRepository {
  final AudioDatabase _database;
  final AlbumDetailsService albumDetailsService = AlbumDetailsService.create();

  AlbumDetailsRepository(this._database);

  Future<List<DetailAlbum>> getDetailAlbums(String albumId) async {
    final cachedAlbums =
        await _database.watchInfoInDetailAlbum(int.parse(albumId)).first;

    if (cachedAlbums.isNotEmpty) {
      return cachedAlbums;
    } else {
      final songsList = await albumDetailsService.getAlbumSongsList(albumId);
      final albumAppearances =
          songsList.body?.albumAppearances as List<AlbumAppearances>;

      final detailAlbumsToInsert = albumAppearances.map((appearance) {
        return DetailAlbum(
            albumid: int.parse(albumId),
            artistNames: appearance.song.artistNames ?? '',
            headerImageUrl: appearance.song.headerImageUrl ?? '',
            title: appearance.song.title ?? '',
            songImage: appearance.song.songImage ?? '',
            releaseDate: appearance.song.releaseDate ?? '',
            id: appearance.song.id);
      }).toList();

      await _database.addManyDetailAlbums(detailAlbumsToInsert);

      return detailAlbumsToInsert;
    }
  }
}
