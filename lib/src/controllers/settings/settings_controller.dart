import 'package:flutter/material.dart';
import 'package:tap_code/src/controllers/settings/settings_service.dart';

/// A class that many Widgets can interact with to read user settings, update
/// user settings, or listen to user settings changes.
///
/// Controllers glue Data Services to Flutter Widgets. The SettingsController
/// uses the SettingsService to store and retrieve user settings.
class SettingsController with ChangeNotifier {
  SettingsController(this._settingsService);

  final SettingsService _settingsService;

  late ThemeMode _themeMode;
  ThemeMode get themeMode => _themeMode;

  late int _vibrationIntensity;
  int get vibrationIntensity => _vibrationIntensity;

  Future<void> loadSettings() async {
    _themeMode = await _settingsService.themeMode();
    _vibrationIntensity = await _settingsService.vibrationIntensity();

    notifyListeners();
  }

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;

    if (newThemeMode == _themeMode) return;

    _themeMode = newThemeMode;

    notifyListeners();

    await _settingsService.updateThemeMode(newThemeMode);
  }

  Future<void> updateVibrationIntensity(int? intensity) async {
    if (intensity == null) return;

    if (intensity == _vibrationIntensity) return;

    _vibrationIntensity = intensity;

    notifyListeners();

    await _settingsService.updateVibrationIntensity(intensity);
  }
}
