import 'package:flutter/material.dart';
import 'package:tap_code/src/controllers/speech_to_text/stt_controller.dart';

import 'package:tap_code/src/widgets/home_controls/bottom_controls.dart';
import 'package:tap_code/src/widgets/home_controls/home_app_bar.dart';
import 'package:tap_code/src/widgets/home_controls/recording_button.dart';
import 'package:tap_code/src/widgets/home_card_view/translation_cards.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.sttController});

  final SttController sttController;

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: TranslationCards(sttController: sttController),
      bottomNavigationBar: const BottomControls(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: RecordingButton(sttController: sttController),
    );
  }
}
