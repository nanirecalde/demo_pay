import 'package:flutter/material.dart'; // Importa el paquete de Flutter para construir la interfaz de usuario.
import 'package:provider/provider.dart'; // Importa el paquete Provider para la gestión del estado.
import '../components/custom_button.dart'; // Importa un botón personalizado.
import '../components/password_field.dart'; // Importa el campo de contraseña personalizado.
import '../providers/auth_provider.dart'; // Importa el proveedor de autenticación.

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController =
      TextEditingController(); // Controlador para el campo de texto del email.
  final TextEditingController _passwordController =
      TextEditingController(); // Controlador para el campo de texto de la contraseña.
  final _formKey = GlobalKey<FormState>(); // Clave global para el formulario.

  // Función para validar el email.
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese su correo electrónico'; // Mensaje de error si el campo está vacío.
    }
    final RegExp emailRegex = RegExp(
        r'[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,5}');
    if (!emailRegex.hasMatch(value)) {
      return 'Ingrese un correo electrónico válido'; // Mensaje de error si el email no es válido.
    }
    return null; // Retorna null si el email es válido.
  }

  // Función para validar la contraseña.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20), // Padding alrededor del contenido.
        child: Stack(
          children: [
            const Align(
              alignment:
                  Alignment.topLeft, // Alinea el contenido al tope izquierdo.
              child: Column(
                crossAxisAlignment: CrossAxisAlignment
                    .start, // Alinea los hijos al inicio en el eje horizontal.
                children: [
                  SizedBox(height: 40), // Espaciado vertical.
                  Text(
                    '.Pay',
                    style: TextStyle(
                      fontSize: 48, // Tamaño de fuente.
                      fontWeight: FontWeight.bold, // Peso de la fuente.
                    ),
                  ),
                  SizedBox(height: 25), // Espaciado vertical.
                  Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 40, // Tamaño de fuente.
                      fontWeight: FontWeight.bold, // Peso de la fuente.
                    ),
                  ),
                  SizedBox(height: 6), // Espaciado vertical.
                  Text(
                    'Let\'s Get Start',
                    style: TextStyle(
                      fontSize: 16, // Tamaño de fuente.
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey, // Asigna la clave del formulario.
                  child: Column(
                    mainAxisSize:
                        MainAxisSize.min, // Tamaño mínimo de la columna.
                    children: [
                      const SizedBox(height: 200), // Espaciado vertical.
                      TextFormField(
                        controller:
                            _emailController, // Controlador del campo de texto del email.
                        keyboardType: TextInputType
                            .emailAddress, // Tipo de teclado para email.
                        decoration: InputDecoration(
                          hintText: 'Email', // Texto de sugerencia.
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Bordes redondeados.
                          ),
                        ),
                        validator: _validateEmail, // Validador del email.
                      ),
                      const SizedBox(height: 20), // Espaciado vertical.
                      PasswordField(
                        controller:
                            _passwordController, // Controlador del campo de texto de la contraseña.
                      ),
                      const SizedBox(height: 10), // Espaciado vertical.
                      Align(
                        alignment: Alignment
                            .centerRight, // Alinea el contenido a la derecha.
                        child: TextButton(
                          onPressed: () {
                            // Mostrar una alerta simple para Forget Password
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text(
                                    'Forgot Password'), // Título del diálogo.
                                content: const Text(
                                    'Reset password here!'), // Contenido del diálogo.
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('OK'), // Texto del botón.
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Cierra el diálogo.
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                          child: const Text(
                              'Forget Password?'), // Texto del botón.
                        ),
                      ),
                      const SizedBox(height: 20), // Espaciado vertical.
                      CustomButton(
                        text: 'Log In', // Texto del botón.
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Valida el formulario.
                            final authProvider = Provider.of<AuthProvider>(
                                context,
                                listen:
                                    false); // Obtiene el proveedor de autenticación.
                            authProvider.login(
                                _emailController.text,
                                _passwordController
                                    .text); // Llama al método de login.

                            if (authProvider.isAuthenticated) {
                              // Verifica si la autenticación fue exitosa.
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text(
                                      'Success'), // Título del diálogo.
                                  content: const Text(
                                      'Login successful!'), // Contenido del diálogo.
                                  actions: <Widget>[
                                    TextButton(
                                      child:
                                          const Text('OK'), // Texto del botón.
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Cierra el diálogo.
                                      },
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text(
                                      'Error'), // Título del diálogo.
                                  content: const Text(
                                      'Invalid email or password'), // Contenido del diálogo.
                                  actions: <Widget>[
                                    TextButton(
                                      child:
                                          const Text('OK'), // Texto del botón.
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Cierra el diálogo.
                                      },
                                    ),
                                  ],
                                ),
                              );
                            }
                          }
                        },
                      ),
                      const SizedBox(height: 20), // Espaciado vertical.
                      TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text(
                                  'Create Account'), // Título del diálogo.
                              content: const Text(
                                  'Create your account here!'), // Contenido del diálogo.
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('OK'), // Texto del botón.
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Cierra el diálogo.
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                        child: const Text(
                          'New User? Create Account', // Texto del botón.
                          style: TextStyle(
                              color: Color.fromARGB(
                                  255, 97, 96, 95)), // Estilo del texto.
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
