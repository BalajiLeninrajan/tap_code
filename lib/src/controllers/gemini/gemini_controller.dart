import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiController extends ChangeNotifier {
  final GenerativeModel _model = GenerativeModel(
    model: 'gemini-1.5-flash',
    apiKey: '',
  );

  final ValueNotifier<String> generatedText = ValueNotifier<String>('');
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  void generate(String text) async {
    isLoading.value = true;
    // final GenerateContentResponse response = await _model.generateContent(
    //   [Content.text(text)],
    // );
    // generatedText.value = response.text ?? '';
    await Future.delayed(Duration(seconds: 10));
    isLoading.value = false;
  }
}
