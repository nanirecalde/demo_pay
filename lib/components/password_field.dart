// Importa el paquete de Flutter para construir la interfaz de usuario.
import 'package:flutter/material.dart';

// Define una clase `PasswordField` que extiende `StatefulWidget`.
// Este widget representa un campo de texto para ingresar una contraseña.
class PasswordField extends StatefulWidget {
  // Propiedad final que almacena el controlador para el campo de texto de la contraseña.
  final TextEditingController controller;

  // Constructor de la clase `PasswordField` que inicializa la propiedad `controller` con el valor proporcionado.
  // `controller` es requerido.
  const PasswordField({
    required this.controller, // Inicializa la propiedad `controller` con el valor proporcionado.
    super.key, // Inicializa la clave del widget.
  });

  // Método que crea el estado del widget `PasswordField`.
  @override
  PasswordFieldState createState() => PasswordFieldState();
}

// Define la clase `PasswordFieldState` que extiende `State<PasswordField>`.
// Esta clase maneja el estado del widget `PasswordField`.
class PasswordFieldState extends State<PasswordField> {
  // Variable booleana privada que controla la visibilidad del texto de la contraseña.
  bool _obscureText = true;

  // Método `build` que describe cómo construir el widget en términos de otros widgets más bajos.
  @override
  Widget build(BuildContext context) {
    // Retorna un campo de formulario de texto (TextFormField) configurado para ingresar contraseñas.
    return TextFormField(
      controller: widget.controller, // Asigna el controlador al campo de texto.
      obscureText: _obscureText, // Controla si el texto está oculto o visible.
      decoration: InputDecoration(
        hintText:
            'Password', // Texto de sugerencia que se muestra cuando el campo está vacío.
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              10), // Bordes redondeados para el campo de texto.
        ),
        // Sufijo del campo de texto que contiene un botón de icono.
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText
                ? Icons
                    .visibility // Icono de "ver" si la contraseña está oculta.
                : Icons
                    .visibility_off, // Icono de "no ver" si la contraseña está visible.
          ),
          // Define la acción que se ejecutará cuando se presione el botón de icono.
          onPressed: () {
            setState(() {
              // Cambia el estado de `_obscureText` para alternar la visibilidad de la contraseña.
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
      // Validador del campo de texto que verifica si la entrada es válida.
      validator: (value) {
        if (value == null || value.isEmpty) {
          // Retorna un mensaje de error si el campo está vacío.
          return 'Please enter your password';
        }
        if (value.length < 4) {
          // Retorna un mensaje de error si la contraseña es muy corta.
          return 'Password must be at least 4 characters long';
        }
        // Retorna null si la contraseña es válida.
        return null;
      },
    );
  }
}
