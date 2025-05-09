import 'package:app/themes/light_mode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dark_mode.dart';

class ThemeProvider extends ChangeNotifier{
  //light mode
  ThemeData _themeData=lightMode;
  //get theme
  ThemeData get themeData => _themeData;
  // dark mode
  bool get isDarkMode => _themeData==darkMode;
  //set theme
  set themeData(ThemeData themeData){
    _themeData=themeData;
    //update ui
    notifyListeners();
  }
  //toggle theme
  void toggleTheme(){
    if(_themeData==lightMode){
      themeData=darkMode;
    }else{
      themeData=lightMode;
    }
  }
}