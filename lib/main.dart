import 'package:flutter/material.dart'; // Importa el paquete de Flutter para construir la interfaz de usuario.
import 'package:provider/provider.dart'; // Importa el paquete Provider para la gestión del estado.
import 'screens/login_screen.dart'; // Importa la pantalla de inicio de sesión.
import 'providers/auth_provider.dart'; // Importa el proveedor de autenticación.

void main() {
  runApp(const MyApp()); // Ejecuta la aplicación MyApp.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor de la clase MyApp.

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          AuthProvider(), // Crea una instancia de AuthProvider para la gestión del estado.
      child: const MaterialApp(
        debugShowCheckedModeBanner: false, // Oculta la bandera de modo debug.
        home:
            LoginScreen(), // Establece la pantalla de inicio de sesión como la pantalla principal.
      ),
    );
  }
}
