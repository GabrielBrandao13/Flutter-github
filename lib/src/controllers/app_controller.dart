import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppController extends ChangeNotifier {
  bool isDarkTheme = true;
  final isDarkThemeKey = 'isDarkTheme';

  AppController() {
    getTheme();
  }

  Future getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    isDarkTheme = prefs.getBool(isDarkThemeKey) ?? isDarkTheme;
    notifyListeners();
  }

  Future saveThemePref() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(isDarkThemeKey, isDarkTheme);
  }

  void switchTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
    saveThemePref();
  }

  static AppController instance = AppController();
}
