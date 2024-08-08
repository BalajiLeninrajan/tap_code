import 'package:flutter/material.dart';

import 'package:tap_code/src/controllers/gemini_controller.dart';
import 'package:tap_code/src/controllers/settings/settings_controller.dart';
import 'package:tap_code/src/controllers/settings/settings_service.dart';
import 'package:tap_code/src/controllers/stt_controller.dart';

import 'package:tap_code/src/app.dart';
import 'package:tap_code/src/controllers/vibration_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  final SttController sttController = SttController();

  final GeminiController geminiController = GeminiController();

  final VibrationController vibrationController = VibrationController();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(TapCode(
    settingsController: settingsController,
    sttController: sttController,
    geminiController: geminiController,
    vibrationController: vibrationController,
  ));
}
