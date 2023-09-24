import 'package:audio_player/databases/database.dart';
import 'package:audio_player/models/models.dart';
import 'package:audio_player/services/service.dart';

class AlbumDetailsRepository {
  final AudioAppDatabase _database;
  final AudioPlayerService _albumDetailsService;

  AlbumDetailsRepository(this._database, this._albumDetailsService);

  Future<List<DetailAlbum>> getDetailAlbums(String albumId) async {
    final cachedAlbums =
        await _database.watchInfoInDetailAlbum(int.parse(albumId)).first;

    if (cachedAlbums.isNotEmpty) {
      return cachedAlbums;
    } else {
      final songsList = await _albumDetailsService.getAlbumSongsList(albumId);
      final albumAppearances = songsList.body?.data as List<AlbumData>;

      final detailAlbumsToInsert = albumAppearances.map((albumData) {
        return DetailAlbum(
            preview: albumData.preview,
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

//   List<DetailAlbum> buildDetailAlbumsToInsert(String albumId, List<AlbumData> albumAppearances) {
//   return albumAppearances.map((albumData) {
//     return DetailAlbum(
//       preview: albumData.preview,
//       type: albumData.type,
//       albumid: int.parse(albumId),
//       artistNames: albumData.artist.name,
//       title: albumData.title,
//       id: int.parse(albumData.id.toString()),
//     );
//   }).toList();
// }
}
