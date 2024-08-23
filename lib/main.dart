import 'package:flutter/material.dart'; // Importa el paquete de Flutter para construir la interfaz de usuario.
import 'package:provider/provider.dart'; // Importa el paquete Provider para la gestión del estado.
import 'providers/auth_provider.dart'; // Importa el proveedor de autenticación.
import 'providers/card_color_provider.dart'; // Importa el proveedor de color de la tarjeta.
import 'providers/send_money_provider.dart'; // Importa el proveedor de envío de dinero.
import 'providers/financial_provider.dart'; // Importa el proveedor de datos financieros.
import 'screens/login_screen.dart'; // Importa la pantalla de inicio de sesión.
import 'screens/home_screen.dart'; // Importa la pantalla principal.
import 'screens/send_money_screen.dart'; // Importa la pantalla de envío de dinero.
import 'screens/confirm_send_screen.dart'; // Importa la pantalla de confirmación de envío.
import 'screens/success_screen.dart'; // Importa la pantalla de éxito.

void main() {
  runApp(
    MultiProvider(
      providers: [
        // Proveedor para la autenticación.
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        // Proveedor para el envío de dinero.
        ChangeNotifierProvider(create: (_) => SendMoneyProvider()),
        // Proveedor para el color de la tarjeta.
        ChangeNotifierProvider(create: (context) => CardColorProvider()),
        // Proveedor para los datos financieros.
        ChangeNotifierProvider(create: (context) => FinancialProvider()),
      ],
      child: const MyApp(), // El widget principal de la aplicación.
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor de la clase MyApp.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banking App', // Título de la aplicación.
      debugShowCheckedModeBanner: false, // Oculta la bandera de modo debug.
      theme: ThemeData(
        primarySwatch:
            Colors.blue, // Define el tema principal de la aplicación.
      ),
      initialRoute: '/', // Ruta inicial de la aplicación.
      routes: {
        '/': (context) =>
            const LoginScreen(), // Ruta para la pantalla de inicio de sesión.
        '/home': (context) =>
            const HomeScreen(), // Ruta para la pantalla principal.
        '/send': (context) =>
            const SendMoneyScreen(), // Ruta para la pantalla de envío de dinero.
        '/confirm': (context) => ConfirmSendScreen(
              amount: 0,
              onConfirmed: () {},
            ), // Ruta para la pantalla de confirmación de envío.
        '/success': (context) =>
            const SuccessScreen(), // Ruta para la pantalla de éxito.
      },
    );
  }
}
