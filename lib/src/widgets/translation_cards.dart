import 'package:flutter/material.dart';
import 'package:tap_code/src/controllers/speech_to_text/stt_controller.dart';

class TranslationCards extends StatefulWidget {
  const TranslationCards({super.key, required this.sttController});

  final SttController sttController;

  @override
  State<TranslationCards> createState() => _TranslationCardsState();
}

class _TranslationCardsState extends State<TranslationCards> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Card(
              color: Theme.of(context).colorScheme.primary,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: ValueListenableBuilder(
                    valueListenable: widget.sttController.text,
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
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Card(
              color: Theme.of(context).colorScheme.secondary,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: true
                    ? SingleChildScrollView(
                        child: Text(
                          'Card 2',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontSize: 24,
                          ),
                        ),
                      )
                    // ignore: dead_code
                    : Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.onSecondary,
                          strokeWidth: 2,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
