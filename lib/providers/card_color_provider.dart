import 'package:flutter/material.dart';

// Esta clase `CardColorProvider` extiende `ChangeNotifier`, lo que permite notificar a los oyentes cuando hay cambios en los datos.
class CardColorProvider with ChangeNotifier {
  // Lista privada de colores inicializada con algunos colores predeterminados.
  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
  ];

  // Índice privado que rastrea el color actual seleccionado.
  int _currentIndex = 0;

  // Getter para obtener la lista de colores. Esto permite acceder a la lista de colores desde fuera de la clase.
  List<Color> get colors => _colors;

  // Getter para obtener el color actual basado en `_currentIndex`.
  Color get currentColor => _colors[_currentIndex];

  // Método para cambiar el color actual. Actualiza `_currentIndex` y notifica a los oyentes sobre el cambio.
  void changeColor(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  // Método para actualizar un color específico en la lista. Cambia el color en el índice dado y notifica a los oyentes sobre el cambio.
  void updateColor(int index, Color newColor) {
    _colors[index] = newColor;
    notifyListeners();
  }
}
