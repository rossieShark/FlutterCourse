import 'package:audio_player/databases/database.dart';
import 'package:audio_player/services/service.dart';

class SongDetailRepository {
  final AudioAppDatabase _database;
  final AudioPlayerService _songDetailsService = AudioPlayerService.create();

  SongDetailRepository(this._database);

  Future<DetailInfoSong?> getDetailSongInfo(String id) async {
    try {
      final int songId = int.parse(id);


      final detailSong = await _database.watchDetailSongById(songId).first;


      if (detailSong == null) {
        try {
          final apiResponse = await _songDetailsService.getDetailSongs(id);

          if (apiResponse.isSuccessful) {
            final albumAppearances = apiResponse.body;
            final detailSongToInsert = DetailInfoSong(
              type: albumAppearances?.type ?? 'track',
              id: int.parse(id),
              preview: albumAppearances?.preview ?? '',
              artistNames: albumAppearances?.contributors[0].name ?? '',
              title: albumAppearances?.title ?? '',
              imageUrl: albumAppearances?.contributors[0].image ?? '',
            );

  
            await _database.insertDetailSong(detailSongToInsert);

            return detailSongToInsert;
          } else {
       
            print('API request failed: ${apiResponse.error}');
            return null;
          }
        } catch (apiException) {
 
          print('API request error: $apiException');
          return null;
        }
      }

      return detailSong;
    } catch (e) {

      print('Error: $e');
      return null;
    }
  }
}
