// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyTheme {
  static Color lightBackground = Color(0xfff0f0f0);
  static Color darkForeground = Color(0xff373737);

  static ThemeData get lightTheme => ThemeData(
        primaryColorBrightness: Brightness.light,
        canvasColor: Colors.white,
        cardColor: lightBackground,
        colorScheme: ColorScheme.light(
          background: lightBackground,
          primary: darkForeground,
        ),
      );
  static ThemeData get darkTheme => ThemeData(
        primaryColorBrightness: Brightness.dark,
        canvasColor: Colors.black,
        cardColor: darkForeground,
        colorScheme: ColorScheme.dark(
          background: Colors.black,
          primary: Colors.white,
        ),
      );
}
