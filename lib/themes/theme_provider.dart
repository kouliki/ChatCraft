// import 'dart:html';

import 'package:flutter/material.dart';

import 'dark_mode.dart';
import 'light_mde.dart';
class ThemeProvider extends ChangeNotifier{
  ThemeData _themeData =LightMode;
  ThemeData get themeData => _themeData;
  bool get isDarkMode => _themeData == DarkMode;

  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }
  void toggleTheme(){
    if(_themeData == LightMode)
      {
        themeData=DarkMode;
      }
    else{
      themeData=LightMode;
    }
  }


}