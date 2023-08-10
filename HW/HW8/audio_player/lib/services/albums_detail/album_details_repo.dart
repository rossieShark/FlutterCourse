import 'package:audio_player/models/models.dart';
import 'package:audio_player/services/services.dart';

class AlbumDetailsRepository {
  final AlbumDetailsService albumDetailsService = AlbumDetailsService.create();

  Future<List<AlbumAppearances>> getAlbumSongsList(String id) async {
    // await Future.delayed(const Duration(seconds: 1));
    print('Data is fetching');
    final songsList = await albumDetailsService.getAlbumSongsList(id);

    final albumAppearances =
        songsList.body?.album_appearances as List<AlbumAppearances>;

    return albumAppearances;
  }
}
