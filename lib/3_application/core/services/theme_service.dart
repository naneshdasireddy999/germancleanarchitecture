import 'package:flutter/material.dart';

class ThemeService extends ChangeNotifier {
  bool isdarkmode = false;
  void toggletheme() {
    isdarkmode = !isdarkmode;
    notifyListeners();
  }
}
