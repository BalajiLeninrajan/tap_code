import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class VibrationController extends ChangeNotifier {
  final Map<String, List<int>> _morseCodeMap = {
    'a': [1, 1, 3, 3],
    'b': [3, 1, 1, 1, 1, 1, 1, 3],
    'c': [3, 1, 1, 1, 3, 1, 1, 3],
    'd': [3, 1, 1, 1, 1, 3],
    'e': [1, 3],
    'f': [1, 1, 1, 1, 3, 1, 1, 3],
    'g': [3, 1, 3, 1, 1, 3],
    'h': [1, 1, 1, 1, 1, 1, 1, 3],
    'i': [1, 1, 1, 3],
    'j': [1, 1, 3, 1, 3, 1, 3, 3],
    'k': [3, 1, 1, 1, 3, 3],
    'l': [1, 1, 3, 1, 1, 1, 1, 3],
    'm': [3, 1, 3, 3],
    'n': [3, 1, 1, 3],
    'o': [3, 1, 3, 1, 3, 3],
    'p': [1, 1, 3, 1, 3, 1, 1, 3],
    'q': [3, 1, 3, 1, 1, 1, 3, 3],
    'r': [1, 1, 3, 1, 1, 3],
    's': [1, 1, 1, 1, 1, 3],
    't': [3, 3],
    'u': [1, 1, 1, 1, 3, 3],
    'v': [1, 1, 1, 1, 1, 1, 3, 3],
    'w': [1, 1, 3, 1, 3, 3],
    'x': [3, 1, 1, 1, 1, 1, 3, 3],
    'y': [3, 1, 1, 1, 3, 1, 3, 3],
    'z': [3, 1, 3, 1, 1, 1, 1, 3],
  };

  int vibrate(String text, int vibrationLength) {
    List<int> pattern = [0];
    text.split('').forEach((String ch) {
      if (ch == ' ') {
        pattern.removeLast();
        pattern.add(7);
      } else if (_morseCodeMap.containsKey(ch)) {
        pattern += _morseCodeMap[ch]!;
      }
    });
    Vibration.vibrate(
      pattern: pattern.map((int x) => x * vibrationLength).toList(),
    );
    return pattern.reduce((int a, int b) => a + b) * vibrationLength;
  }

  void stop() {
    Vibration.cancel();
  }
}
