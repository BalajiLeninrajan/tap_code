import 'package:flutter/material.dart';
import 'package:tap_code/src/controllers/settings/settings_controller.dart';

class ThemeModeSelector extends StatelessWidget {
  const ThemeModeSelector({
    super.key,
    required this.controller,
  });

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<ThemeMode>(
      isExpanded: true,
      value: controller.themeMode,
      onChanged: controller.updateThemeMode,
      items: const [
        DropdownMenuItem(
          value: ThemeMode.system,
          child: Text('System Theme'),
        ),
        DropdownMenuItem(
          value: ThemeMode.light,
          child: Text('Light Theme'),
        ),
        DropdownMenuItem(
          value: ThemeMode.dark,
          child: Text('Dark Theme'),
        )
      ],
    );
  }
}
