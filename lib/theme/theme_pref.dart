import 'package:shared_preferences/shared_preferences.dart';

class ThemePref {
  static const String key = "isDarkMode";

  // Save theme (true = dark, false = light)
  static Future<void> saveTheme(bool isDark) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, isDark);
  }

  // Load saved theme (default = false -> light)
  static Future<bool> loadTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }
}
