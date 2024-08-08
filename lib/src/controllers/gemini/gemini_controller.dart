import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiController extends ChangeNotifier {
  final GenerativeModel _model = GenerativeModel(
    model: 'gemini-1.5-flash',
    apiKey: '',
  );

  String generatedText = '';
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  void generate(String text) async {
    isLoading.value = true;
    final GenerateContentResponse response = await _model.generateContent(
      [
        Content.text(
          '''
          Ignoring proper grammer, spelling and puncuation, 
          summerize the following text 
          in as few characters as possible
          to optimize sending it through morse code 
          (for example "how are you?" becomes "hw u"):
          $text
          Only return the summary and no other text, 
          only use alphanumeric characters and space, no other symbols
          ''',
        )
      ],
    );
    generatedText = response.text ?? '';
    isLoading.value = false;
  }
}
