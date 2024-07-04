import 'package:flutter/material.dart';

class DarkMode extends ChangeNotifier {
  bool _enableDarkMode = false;

  bool get enableDarkMode => _enableDarkMode;

  set ganti(val) {
    _enableDarkMode = val;
    notifyListeners();
  }

  var light = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.yellow,
      useMaterial3: false);

  var dark = ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.yellow,
      useMaterial3: false);
}