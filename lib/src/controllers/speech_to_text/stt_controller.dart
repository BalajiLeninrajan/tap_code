import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SttController extends ChangeNotifier {
  final SpeechToText _speechToText = SpeechToText();

  String _text = '';
  String get text => _text;

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

    _text = '';
    _isListening = true;
    _speechToText.listen(
      onResult: (SpeechRecognitionResult result) {
        _text = result.recognizedWords;
      },
    );

    return true;
  }
}
