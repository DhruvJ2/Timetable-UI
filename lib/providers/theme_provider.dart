import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final darkTheme = ThemeData(
  primaryColor: Color.fromARGB(255, 41, 41, 41),
  backgroundColor: Color.fromARGB(255, 34, 34, 34),
  brightness: Brightness.dark,
  textTheme: const TextTheme(
    headline1: TextStyle(
      color: Colors.white,
      fontSize: 28.0,
      fontWeight: FontWeight.w400,
    ),
    subtitle1: TextStyle(
      color: Colors.white,
      fontSize: 16.0,
      fontWeight: FontWeight.w300,
    ),
  ),
  iconTheme: IconThemeData(color: Colors.blue[700]),
  dividerColor: Colors.black12,
);
final lightTheme = ThemeData(
  primaryColor: Color.fromARGB(255, 255, 255, 255),
  backgroundColor: Color.fromARGB(255, 236, 249, 251),
  brightness: Brightness.light,
  textTheme: const TextTheme(
    headline1: TextStyle(
      color: Colors.black,
      fontSize: 28.0,
      fontWeight: FontWeight.w400,
    ),
    subtitle1: TextStyle(
      color: Colors.black45,
      fontSize: 16.0,
      fontWeight: FontWeight.w300,
    ),
  ),
  iconTheme: IconThemeData(color: Colors.blue[700]),
  dividerColor: Colors.black12,
);

class ThemePreference {
  static const PREF_KEY = "pref_key";

  setTheme(bool value) async {
    SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
    sharedpreferences.setBool(PREF_KEY, value);
  }

  getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.getBool(PREF_KEY) ?? false;
  }
}

// class ThemeNotifier with ChangeNotifier {
//   ThemeData _themeData;

//   ThemeNotifier(this._themeData);

//   getTheme() => _themeData;

//   setTheme(ThemeData themeData) async {
//     _themeData = themeData;
//     notifyListeners();
//   }
// }

// class OnThemeChange with ChangeNotifier {
//   bool isDarkMode = false;
//   getDarkMode() => isDarkMode;
//   changeDarkMode(isDarkMode) {
//     this.isDarkMode = isDarkMode;
//     notifyListeners();
//   }
// }
