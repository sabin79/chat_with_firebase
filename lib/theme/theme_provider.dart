import 'package:chat_with_firebase/theme/dark_theme.dart';
import 'package:chat_with_firebase/theme/light_theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightTheme; // Correct initialization with `lightTheme`

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeData) {
    // Fix: Ensure the property name matches convention
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightTheme) {
      themeData = darkMode;
    } else {
      themeData = lightTheme;
    }
  }
}
