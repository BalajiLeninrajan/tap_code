import 'package:flutter/material.dart';
import 'package:tap_code/src/widgets/bottom_controls.dart';

import 'package:tap_code/src/widgets/home_app_bar.dart';
import 'package:tap_code/src/widgets/recording_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeAppBar(),
      body: Placeholder(),
      bottomNavigationBar: BottomControls(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: RecordingButton(),
    );
  }
}
