import 'package:audio_player/models/models.dart';
import 'package:audio_player/services/services.dart';

class SongDetailRepository {
  final SongDetailsService songDetailsService = SongDetailsService.create();

  Future<SongDetail> getSongInfo(String id) async {
    // await Future.delayed(const Duration(seconds: 1));
    print('Data is fetching');
    final songsList = await songDetailsService.getSongInfo(id);

    final albumAppearances = songsList.body?.song as SongDetail;

    return albumAppearances;
  }
}
