import 'package:flutter/material.dart'; // Importa el paquete de Flutter para construir la interfaz de usuario.

class SendMoneyProvider with ChangeNotifier {
  // Define una clase que extiende ChangeNotifier para la gestión del estado.
  String _contactName =
      ''; // Variable privada para almacenar el nombre del contacto.
  String _contactAccount =
      ''; // Variable privada para almacenar la cuenta del contacto.
  String _contactAvatar =
      ''; // Variable privada para almacenar el avatar del contacto.
  double _amount = 0.0; // Variable privada para almacenar el monto a enviar.

  // Getters para acceder a las variables privadas desde fuera de la clase.
  String get contactName => _contactName; // Obtiene el nombre del contacto.
  String get contactAccount =>
      _contactAccount; // Obtiene la cuenta del contacto.
  String get contactAvatar => _contactAvatar; // Obtiene el avatar del contacto.
  double get amount => _amount; // Obtiene el monto a enviar.

  // Método para establecer los detalles del contacto.
  void setContactDetails(String name, String account, String avatar) {
    _contactName = name; // Asigna el nombre del contacto.
    _contactAccount = account; // Asigna la cuenta del contacto.
    _contactAvatar = avatar; // Asigna el avatar del contacto.
    notifyListeners(); // Notifica a los oyentes que el estado ha cambiado.
  }

  // Método para actualizar el monto a enviar.
  void updateAmount(double value) {
    _amount = value; // Asigna el nuevo monto.
    notifyListeners(); // Notifica a los oyentes que el estado ha cambiado.
  }

  // Método para reiniciar los detalles del contacto y el monto.
  void reset() {
    _contactName = ''; // Reinicia el nombre del contacto.
    _contactAccount = ''; // Reinicia la cuenta del contacto.
    _contactAvatar = ''; // Reinicia el avatar del contacto.
    _amount = 0.0; // Reinicia el monto.
    notifyListeners(); // Notifica a los oyentes que el estado ha cambiado.
  }
}
