import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  SharedPreferences? _prefs;
  String currentLocale = 'en';

  LocaleProvider() {
    initPreferences();
  }

  Future<void> initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    currentLocale = _prefs!.getString('locale') ?? 'en';
    notifyListeners();
  }

  void appLanguage(String newLanguage) {
    if (currentLocale == newLanguage) return;
    currentLocale = newLanguage;
    _prefs!.setString('locale', newLanguage);
    notifyListeners();
  }
}
