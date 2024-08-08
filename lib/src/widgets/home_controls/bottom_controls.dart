import 'package:flutter/material.dart';
import 'package:tap_code/src/controllers/gemini_controller.dart';
import 'package:tap_code/src/controllers/stt_controller.dart';
import 'package:tap_code/src/controllers/vibration_controller.dart';

class BottomControls extends StatefulWidget {
  const BottomControls({
    super.key,
    required this.geminiController,
    required this.sttController,
    required this.vibrationController,
  });

  final SttController sttController;
  final GeminiController geminiController;
  final VibrationController vibrationController;

  @override
  State<BottomControls> createState() => _BottomControlsState();
}

class _BottomControlsState extends State<BottomControls> {
  bool _isVibrating = false;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ValueListenableBuilder(
            valueListenable: widget.geminiController.isLoading,
            builder: (BuildContext context, bool isLoading, Widget? wid) {
              return IconButton(
                onPressed: isLoading
                    ? null
                    : () => widget.geminiController
                        .generate(widget.sttController.text.value),
                icon: const Icon(Icons.restart_alt),
              );
            },
          ),
          IconButton(
            onPressed: _isVibrating
                ? null
                : () async {
                    setState(() {
                      _isVibrating = true;
                    });
                    int duration = widget.vibrationController.vibrate(
                      widget.geminiController.generatedText,
                    );
                    await Future.delayed(Duration(milliseconds: duration));
                    setState(() {
                      _isVibrating = false;
                    });
                  },
            icon: const Icon(Icons.play_arrow),
          )
        ],
      ),
    );
  }
}
