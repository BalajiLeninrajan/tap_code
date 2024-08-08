import 'package:flutter/material.dart';
import 'package:tap_code/src/controllers/speech_to_text/stt_controller.dart';
import 'package:tap_code/src/widgets/home_card_view/llm_result_card.dart';
import 'package:tap_code/src/widgets/home_card_view/stt_result_card.dart';

class TranslationCards extends StatelessWidget {
  const TranslationCards({super.key, required this.sttController});

  final SttController sttController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: STTResultCard(sttController: sttController),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: LLMResultCard(),
          ),
        ],
      ),
    );
  }
}
