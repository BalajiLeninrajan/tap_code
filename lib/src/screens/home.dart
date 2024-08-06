import 'package:flutter/material.dart';
import 'package:tap_code/src/controllers/speech_to_text/stt_controller.dart';
import 'package:tap_code/src/widgets/bottom_controls.dart';

import 'package:tap_code/src/widgets/home_app_bar.dart';
import 'package:tap_code/src/widgets/recording_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.sttController});

  final SttController sttController;

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: const Placeholder(),
      bottomNavigationBar: const BottomControls(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: RecordingButton(sttController: sttController),
    );
  }
}
