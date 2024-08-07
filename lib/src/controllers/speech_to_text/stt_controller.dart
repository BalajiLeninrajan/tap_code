import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SttController extends ChangeNotifier {
  final SpeechToText _speechToText = SpeechToText();

  final ValueNotifier<String> text = ValueNotifier<String>('');

  bool _isListening = false;
  bool get isListening => _isListening;

  Future<bool> listen() async {
    if (isListening) {
      _isListening = false;
      _speechToText.stop();
      notifyListeners();
      return true;
    }

    if (!await _speechToText.initialize()) {
      notifyListeners();
      return false;
    }

    text.value = '';
    _isListening = true;
    _speechToText.listen(
      onResult: (SpeechRecognitionResult result) {
        text.value = result.recognizedWords;
        notifyListeners();
      },
    );

    return true;
  }
}
