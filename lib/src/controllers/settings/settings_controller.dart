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

  late double _vibrationDuration;
  double get vibrationDuration => _vibrationDuration;

  Future<void> loadSettings() async {
    _themeMode = await _settingsService.themeMode();
    _vibrationDuration = await _settingsService.vibrationDuration();

    notifyListeners();
  }

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;

    if (newThemeMode == _themeMode) return;

    _themeMode = newThemeMode;

    notifyListeners();

    await _settingsService.updateThemeMode(newThemeMode);
  }

  Future<void> updateVibrationDuration(double duration) async {
    if (duration == _vibrationDuration) return;

    _vibrationDuration = duration;

    notifyListeners();

    await _settingsService.updateVibrationDuration(duration);
  }
}
