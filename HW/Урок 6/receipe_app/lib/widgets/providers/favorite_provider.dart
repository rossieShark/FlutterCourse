import 'package:flutter/material.dart';

import '../../models/models_export.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<Recipe> _favoriteReceipe = [];

  List<Recipe> get favoriteReceipe => _favoriteReceipe;

  void addToFavorites(Recipe recipe) {
    _favoriteReceipe.add(recipe);
    notifyListeners();
  }

  void removeFromFavorites(Recipe recipe) {
    _favoriteReceipe.removeWhere((item) => item.name == recipe.name);
    notifyListeners();
  }
}
