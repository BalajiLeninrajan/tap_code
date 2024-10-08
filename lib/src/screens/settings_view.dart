import 'package:flutter/material.dart';

import 'package:tap_code/src/controllers/settings/settings_controller.dart';
import 'package:tap_code/src/widgets/settings/theme_mode_selector_widget.dart';
import 'package:tap_code/src/widgets/settings/vibration_duration_slider.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.controller});

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(64),
        child: Center(
          child: Column(
            children: [
              ThemeModeSelector(controller: controller),
              const SizedBox(height: 32),
              VibrationDurationSlider(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}
