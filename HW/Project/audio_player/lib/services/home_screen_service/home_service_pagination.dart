import 'package:audio_player/databases/database.dart';

import 'package:audio_player/services/services.dart';

class BestAlbumsPaginationService {
  final BestAlbumRepository _bestAlbumsRepository;
  BestAlbumsPaginationService(this._bestAlbumsRepository);
  bool _isLoading = false;

  // final BestAlbumRepository _bestAlbumsRepository =
  //     BestAlbumRepository(GetIt.I<AudioAppDatabase>(), GetIt.instance.get());
  final int _perPage = 10;
  int _index = 0;
  int _limit = 10;

  List<BestAlbum> items = [];

  bool get isLoading => _isLoading;

  Future<void> loadMoreItems() async {
    if (_isLoading) return;
    _isLoading = true;

    try {
      final newPortion =
          await _bestAlbumsRepository.getBestAlbums(_index, _limit);

      items.addAll(newPortion);
      _index += _perPage;
      _limit += _perPage;
    } finally {
      _isLoading = false;
    }
  }
}
