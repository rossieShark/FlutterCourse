import 'package:project/databases/database.dart';
import 'package:project/models/models.dart';
import 'package:project/services/service.dart';

class AlbumDetailsRepository {
  final AudioAppDatabase _database;
  final AudioPlayerService albumDetailsService = AudioPlayerService.create();

  AlbumDetailsRepository(this._database);

  Future<List<DetailAlbum>> getDetailAlbums(String albumId) async {
    final cachedAlbums =
        await _database.watchInfoInDetailAlbum(int.parse(albumId)).first;

    if (cachedAlbums.isNotEmpty) {
      return cachedAlbums;
    } else {
      final songsList = await albumDetailsService.getAlbumSongsList(albumId);
      final albumAppearances = songsList.body?.data as List<AlbumData>;

      final detailAlbumsToInsert = albumAppearances.map((albumData) {
        return DetailAlbum(
            type: albumData.type,
            albumid: int.parse(albumId),
            artistNames: albumData.artist.name,
            title: albumData.title,
            id: int.parse(albumData.id.toString()));
      }).toList();

      await _database.addManyDetailAlbums(detailAlbumsToInsert);

      return detailAlbumsToInsert;
    }
  }
}
