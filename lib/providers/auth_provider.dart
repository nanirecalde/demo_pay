import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? _email;
  String? _password;
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  void login(String email, String password) {
    // Verificación de usuario
    if (email == "brunorkld2014@gmail.com" && password == "prueba1234") {
      _isAuthenticated = true;
      _email = email;
      _password = password;
      notifyListeners();
    } else {
      _isAuthenticated = false;
      notifyListeners();
    }
  }

  void logout() {
    _isAuthenticated = false;
    _email = null;
    _password = null;
    notifyListeners();
  }
}
