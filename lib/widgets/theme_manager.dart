import 'package:flutter/material.dart';
import 'package:practice/widgets/theme.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode _themedata = ThemeMode.light;
  get themedata => _themedata;
  toggletheme(bool isDark) {
    _themedata = isDark ? ThemeMode.dark : ThemeMode.light;
  }
}
