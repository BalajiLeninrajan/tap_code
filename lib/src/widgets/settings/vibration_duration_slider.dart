import 'package:flutter/material.dart';
import 'package:tap_code/src/controllers/settings/settings_controller.dart';

class VibrationDurationSlider extends StatelessWidget {
  const VibrationDurationSlider({
    super.key,
    required this.controller,
  });

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('Vibration Duration'),
        Slider(
          value: controller.vibrationDuration,
          min: 50,
          max: 500,
          divisions: 9,
          label: controller.vibrationDuration.round().toString(),
          onChanged: (double value) {
            controller.updateVibrationDuration(value);
          },
        ),
      ],
    );
  }
}
