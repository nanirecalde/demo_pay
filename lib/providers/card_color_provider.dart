import 'package:flutter/material.dart';

class CardColorProvider with ChangeNotifier {
  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
  ];

  int _currentIndex = 0;

  List<Color> get colors => _colors;

  Color get currentColor => _colors[_currentIndex];

  void changeColor(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void updateColor(int index, Color newColor) {
    _colors[index] = newColor;
    notifyListeners();
  }
}
