import 'package:flutter/material.dart'; // Importa el paquete de Flutter para construir la interfaz de usuario.

class AuthProvider extends ChangeNotifier {
  // Define una clase que extiende ChangeNotifier para la gestión del estado.
  String? _email; // Variable privada para almacenar el email del usuario.
  String?
      _password; // Variable privada para almacenar la contraseña del usuario.
  bool _isAuthenticated =
      false; // Variable privada para indicar si el usuario está autenticado.

  bool get isAuthenticated =>
      _isAuthenticated; // Getter para obtener el estado de autenticación.

  void login(String email, String password) {
    // Método para iniciar sesión.
    // Verificación de usuario
    if (email == "brunorkld2014@gmail.com" && password == "prueba1234") {
      // Comprueba si el email y la contraseña son correctos.
      _isAuthenticated =
          true; // Establece el estado de autenticación a verdadero.
      _email = email; // Almacena el email del usuario.
      _password = password; // Almacena la contraseña del usuario.
      notifyListeners(); // Notifica a los oyentes que el estado ha cambiado.
    } else {
      _isAuthenticated = false; // Establece el estado de autenticación a falso.
      notifyListeners(); // Notifica a los oyentes que el estado ha cambiado.
    }
  }

  void logout() {
    // Método para cerrar sesión.
    _isAuthenticated = false; // Establece el estado de autenticación a falso.
    _email = null; // Elimina el email almacenado.
    _password = null; // Elimina la contraseña almacenada.
    notifyListeners(); // Notifica a los oyentes que el estado ha cambiado.
  }
}
