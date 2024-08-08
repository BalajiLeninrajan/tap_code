import 'package:flutter/material.dart';
import 'package:tap_code/src/controllers/gemini_controller.dart';
import 'package:tap_code/src/controllers/stt_controller.dart';

class BottomControls extends StatelessWidget {
  const BottomControls({
    super.key,
    required this.geminiController,
    required this.sttController,
  });

  final SttController sttController;
  final GeminiController geminiController;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ValueListenableBuilder(
            valueListenable: geminiController.isLoading,
            builder: (BuildContext context, bool isLoading, Widget? widget) {
              return IconButton(
                onPressed: isLoading
                    ? null
                    : () => geminiController.generate(sttController.text.value),
                icon: const Icon(Icons.restart_alt),
              );
            },
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.play_arrow),
          )
        ],
      ),
    );
  }
}
