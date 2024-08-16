import 'package:flutter/material.dart'; // Importa el paquete de Flutter para construir la interfaz de usuario.

class CustomButton extends StatelessWidget {
  final String text; // Texto que se mostrará en el botón.
  final VoidCallback
      onPressed; // Función que se ejecutará cuando se presione el botón.

  const CustomButton({
    super.key, // Clave para el widget, utilizada para identificarlo de manera única.
    required this.text, // Parámetro requerido para el texto del botón.
    required this.onPressed, // Parámetro requerido para la función de callback.
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:
          onPressed, // Asigna la función de callback al evento onPressed del botón.
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange, // Color de fondo del botón.
        padding: const EdgeInsets.symmetric(
            horizontal: 50, vertical: 15), // Padding interno del botón.
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(10), // Bordes redondeados del botón.
        ),
      ),
      child: Text(
        text, // Muestra el texto en el botón.
        style: const TextStyle(
            color: Colors.white), // Asegura que el texto siempre sea blanco.
      ),
    );
  }
}
