import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A service that stores and retrieves user settings.
class SettingsService {
  static const String kPrefThemeMode = 'ThemeMode';
  static const String kPrefVibrationDuration = 'VibrationDuration';

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

  Future<void> updateThemeMode(ThemeMode theme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(kPrefThemeMode, theme.name);
  }

  Future<double> vibrationDuration() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(kPrefVibrationDuration) ?? 200;
  }

  Future<void> updateVibrationDuration(double duration) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(kPrefVibrationDuration, duration);
  }
}
