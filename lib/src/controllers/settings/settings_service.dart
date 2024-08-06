import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A service that stores and retrieves user settings.
class SettingsService {
  static const String kPrefThemeMode = 'ThemeMode';

  /// Loads the User's preferred ThemeMode from local storage.
  Future<ThemeMode> themeMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? name = prefs.getString(kPrefThemeMode);
    if (name == ThemeMode.light.name) {
      return ThemeMode.light;
    } else if (name == ThemeMode.dark.name) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateThemeMode(ThemeMode theme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(kPrefThemeMode, theme.name);
  }
}
