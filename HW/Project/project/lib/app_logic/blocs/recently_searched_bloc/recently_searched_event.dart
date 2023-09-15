import 'package:project/models/models.dart';

abstract class RecentlySearchedEvent {}

class AddToRecentlySearchedEvent extends RecentlySearchedEvent {
  final SongModel songModel;

  AddToRecentlySearchedEvent(this.songModel);
}
