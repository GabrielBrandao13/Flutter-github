import 'package:flutter/cupertino.dart';

class AppController extends ChangeNotifier {
  bool isDarkTheme = false;

  void switchTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }

  static AppController instance = AppController();
}
