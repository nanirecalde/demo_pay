import 'package:flutter/material.dart'; // Importa el paquete de Flutter para construir la interfaz de usuario.

class PasswordField extends StatefulWidget {
  final TextEditingController
      controller; // Controlador para el campo de texto de la contraseña.

  const PasswordField({
    required this.controller, // Requiere el controlador como parámetro.
    super.key,
  });

  @override
  PasswordFieldState createState() =>
      PasswordFieldState(); // Crea el estado del widget.
}

class PasswordFieldState extends State<PasswordField> {
  bool _obscureText =
      true; // Variable para controlar la visibilidad de la contraseña.

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller, // Asigna el controlador al campo de texto.
      obscureText: _obscureText, // Controla si el texto está oculto o visible.
      decoration: InputDecoration(
        hintText: 'Password', // Texto de sugerencia.
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), // Bordes redondeados.
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText
                ? Icons.visibility
                : Icons.visibility_off, // Icono de visibilidad.
          ),
          onPressed: () {
            setState(() {
              _obscureText =
                  !_obscureText; // Cambia la visibilidad de la contraseña.
            });
          },
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password'; // Mensaje de error si el campo está vacío.
        }
        if (value.length < 4) {
          return 'Password must be at least 4 characters long'; // Mensaje de error si la contraseña es muy corta.
        }
        return null; // Retorna null si la contraseña es válida.
      },
    );
  }
}
