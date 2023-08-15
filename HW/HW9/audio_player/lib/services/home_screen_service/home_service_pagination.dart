import 'package:audio_player/models/models.dart';
import 'package:audio_player/services/services.dart';

class BestAlbumsPaginationService {
  bool _isLoading = false;

  final RecentlyPlayedRepository _bestAlbumsRepository =
      RecentlyPlayedRepository();
  final int _perPage = 10;
  int _page = 1;

  List<ChartItems> items = [];

  bool get isLoading => _isLoading;

  Future<void> loadMoreItems() async {
    if (_isLoading) return;
    _isLoading = true;
    // await Future.delayed(const Duration(seconds: 2));
    final newPortion =
        await _bestAlbumsRepository.getBestAlbums(_perPage, _page);

    items.addAll(newPortion);
    _isLoading = false;
    _page += 1;
  }
}
