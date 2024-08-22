// Importa el paquete de Flutter para construir la interfaz de usuario.
import 'package:flutter/material.dart';
// Importa el paquete Provider para la gestión del estado.
import 'package:provider/provider.dart';
// Importa componentes personalizados.
import '../components/custom_button.dart';
import '../components/password_field.dart';
// Importa el proveedor de autenticación.
import '../providers/auth_provider.dart';

// Define una clase `LoginScreen` que extiende `StatefulWidget`.
// Este widget representa la pantalla de inicio de sesión.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  // Crea el estado asociado a este widget.
  @override
  LoginScreenState createState() => LoginScreenState();
}

// Define la clase `LoginScreenState` que extiende `State<LoginScreen>`.
// Esta clase maneja el estado del widget `LoginScreen`.
class LoginScreenState extends State<LoginScreen> {
  // Controladores de texto para los campos de correo electrónico y contraseña.
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // Clave global para el formulario, utilizada para validar el formulario.
  final _formKey = GlobalKey<FormState>();

  // Método para validar el correo electrónico.
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese su correo electrónico';
    }
    final RegExp emailRegex = RegExp(
        r'[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,5}');
    if (!emailRegex.hasMatch(value)) {
      return 'Ingrese un correo electrónico válido';
    }
    return null;
  }

  // Método `build` que describe cómo construir el widget en términos de otros widgets más bajos.
  @override
  Widget build(BuildContext context) {
    // Retorna un Scaffold que proporciona la estructura básica de la pantalla.
    return Scaffold(
      // Padding alrededor del contenido de la pantalla.
      body: Padding(
        padding: const EdgeInsets.all(20),
        // Stack para superponer widgets.
        child: Stack(
          children: [
            // Alinea el contenido al principio de la pantalla.
            const Align(
              alignment: Alignment.topLeft,
              // Columna para organizar los widgets verticalmente.
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Text(
                    '.Pay',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Let\'s Get Start',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            // Centra el contenido principal de la pantalla.
            Center(
              // Permite desplazarse si el contenido es demasiado grande para caber en la pantalla.
              child: SingleChildScrollView(
                // Formulario para manejar la validación y el envío.
                child: Form(
                  key: _formKey,
                  // Columna para organizar los widgets verticalmente.
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 200),
                      // Campo de texto para el correo electrónico.
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: _validateEmail,
                      ),
                      const SizedBox(height: 20),
                      // Campo de texto personalizado para la contraseña.
                      PasswordField(
                        controller: _passwordController,
                      ),
                      const SizedBox(height: 10),
                      // Botón de texto para la opción de "Olvidé mi contraseña".
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // Muestra un diálogo para restablecer la contraseña.
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Forgot Password'),
                                content: const Text('Reset password here!'),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                          child: const Text('Forget Password?'),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Botón personalizado para iniciar sesión.
                      CustomButton(
                        text: 'Log In',
                        onPressed: () {
                          // Valida el formulario.
                          if (_formKey.currentState!.validate()) {
                            // Obtiene el proveedor de autenticación.
                            final authProvider = Provider.of<AuthProvider>(
                                context,
                                listen: false);
                            // Llama al método de inicio de sesión del proveedor.
                            authProvider.login(_emailController.text,
                                _passwordController.text);

                            // Verifica si la autenticación fue exitosa.
                            if (authProvider.isAuthenticated) {
                              // Navega a la pantalla principal si la autenticación es exitosa.
                              Navigator.pushReplacementNamed(context, '/home');
                            } else {
                              // Muestra un diálogo de error si la autenticación falla.
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Error'),
                                  content:
                                      const Text('Invalid email or password'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ),
                              );
                            }
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      // Botón de texto para la opción de "Crear cuenta".
                      TextButton(
                        onPressed: () {
                          // Muestra un diálogo para crear una cuenta.
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Create Account'),
                              content: const Text('Create your account here!'),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                        child: const Text(
                          'New User? Create Account',
                          style:
                              TextStyle(color: Color.fromARGB(255, 97, 96, 95)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
