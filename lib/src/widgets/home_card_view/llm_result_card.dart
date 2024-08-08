import 'package:flutter/material.dart';
import 'package:tap_code/src/controllers/gemini/gemini_controller.dart';

class LLMResultCard extends StatelessWidget {
  const LLMResultCard({
    super.key,
    required this.geminiController,
  });

  final GeminiController geminiController;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.secondary,
      child: ValueListenableBuilder(
        valueListenable: geminiController.isLoading,
        builder: (BuildContext context, bool isLoading, Widget? widget) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.onSecondary,
                      strokeWidth: 2,
                    ),
                  )
                : SingleChildScrollView(
                    child: Text(
                      geminiController.generatedText,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontSize: 24,
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
