import 'package:flutter/material.dart';
import 'package:tap_code/src/controllers/speech_to_text/stt_controller.dart';

class STTResultCard extends StatelessWidget {
  const STTResultCard({
    super.key,
    required this.sttController,
  });

  final SttController sttController;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: ValueListenableBuilder(
            valueListenable: sttController.text,
            builder: (BuildContext context, value, Widget? widget) {
              return Text(
                value,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 24,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
