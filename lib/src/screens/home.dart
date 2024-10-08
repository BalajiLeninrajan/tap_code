import 'package:flutter/material.dart';

import 'package:tap_code/src/controllers/gemini_controller.dart';
import 'package:tap_code/src/controllers/settings/settings_controller.dart';
import 'package:tap_code/src/controllers/stt_controller.dart';
import 'package:tap_code/src/controllers/vibration_controller.dart';

import 'package:tap_code/src/widgets/home_controls/bottom_controls.dart';
import 'package:tap_code/src/widgets/home_controls/home_app_bar.dart';
import 'package:tap_code/src/widgets/home_controls/recording_button.dart';
import 'package:tap_code/src/widgets/home_card_view/translation_cards.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
    required this.sttController,
    required this.geminiController,
    required this.vibrationController,
    required this.settingsController,
  });

  final SttController sttController;
  final GeminiController geminiController;
  final VibrationController vibrationController;
  final SettingsController settingsController;

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: TranslationCards(
        sttController: sttController,
        geminiController: geminiController,
      ),
      bottomNavigationBar: BottomControls(
        sttController: sttController,
        geminiController: geminiController,
        vibrationController: vibrationController,
        settingsController: settingsController,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: RecordingButton(
        sttController: sttController,
        geminiController: geminiController,
      ),
    );
  }
}
