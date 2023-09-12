import 'package:flutter/widgets.dart';

class RecentlyPlayedIdProvider extends ChangeNotifier {
  String? _id;

  String? get id => _id;

  void setId(String newId) {
    _id = newId;
    notifyListeners();
  }
}
