import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:tap_code/api_key.dart';

class GeminiController extends ChangeNotifier {
  final GenerativeModel _model = GenerativeModel(
    model: 'gemini-1.5-flash-latest',
    apiKey: apiKey,
  );

  String generatedText = '';
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  void generate(String text) async {
    isLoading.value = true;
    if (text == '') {
      generatedText = 'err no txt';
      isLoading.value = false;
      return;
    }
    late final GenerateContentResponse response;
    try {
      response = await _model.generateContent(
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
    } on Exception {
      generatedText = 'err cant connect';
      isLoading.value = false;
      return;
    }
    generatedText = response.text?.toLowerCase() ?? 'err no txt';
    isLoading.value = false;
  }
}
