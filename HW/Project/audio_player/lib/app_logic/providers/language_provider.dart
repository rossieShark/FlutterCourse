import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Locale _appLocale =
      ui.PlatformDispatcher.instance.locale ?? const Locale('en');

  LanguageProvider() {
    _loadSavedLocale();
  }

  Locale get appLocale => _appLocale;

  Future<void> changeLocale(Locale newLocale) async {
    _appLocale = newLocale;
    final prefs = await _prefs;
    await prefs.setString('appLocale', newLocale.languageCode);
    notifyListeners();
  }

  Future<void> _loadSavedLocale() async {
    final prefs = await _prefs;
    final savedLocaleCode = prefs.getString('appLocale');
    if (savedLocaleCode != null) {
      _appLocale = Locale(savedLocaleCode);
    }
  }
}
