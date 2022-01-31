import 'package:flutter/cupertino.dart';

class AppController extends ChangeNotifier {
  bool isDarkTheme = true;

  void switchTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }

  static AppController instance = AppController();
}
