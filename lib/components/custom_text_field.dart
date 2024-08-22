// Importa el paquete de Flutter Material, que proporciona widgets y temas de diseño Material.
import 'package:flutter/material.dart';

// Define una clase `CustomTextField` que extiende `StatelessWidget`.
// Este widget personalizado representa un campo de texto con algunas propiedades configurables.
class CustomTextField extends StatelessWidget {
  // Propiedad final que almacena el texto de sugerencia (hint) para el campo de texto.
  final String hintText;

  // Propiedad final que almacena el controlador de texto, que gestiona el texto que se introduce en el campo.
  final TextEditingController controller;

  // Propiedad final que define el tipo de teclado que se mostrará cuando el usuario interactúe con el campo de texto.
  final TextInputType keyboardType;

  // Propiedad final opcional que define el estilo del texto dentro del campo de texto.
  final TextStyle? textStyle;

  // Constructor de la clase `CustomTextField` que inicializa las propiedades con los valores proporcionados.
  // `hintText` y `controller` son requeridos, mientras que `keyboardType` y `textStyle` son opcionales.
  const CustomTextField({
    required this.hintText, // Inicializa la propiedad `hintText` con el valor proporcionado.
    required this.controller, // Inicializa la propiedad `controller` con el valor proporcionado.
    this.keyboardType = TextInputType
        .text, // Inicializa `keyboardType` con un valor predeterminado de `TextInputType.text`.
    super.key, // Inicializa la clave del widget.
    this.textStyle, // Inicializa `textStyle` con el valor proporcionado, si lo hay.
  });

  // Getter que devuelve null. No se utiliza en este widget.
  String? get text => null;

  // Getter que devuelve null. No se utiliza en este widget.
  get onPressed => null;

  // Método `build` que describe cómo construir el widget en términos de otros widgets más bajos.
  @override
  Widget build(BuildContext context) {
    // Retorna un botón elevado (ElevatedButton) en lugar de un campo de texto.
    return ElevatedButton(
      onPressed:
          onPressed, // Define la acción que se ejecutará cuando se presione el botón.
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange, // Color de fondo del botón.
        padding: const EdgeInsets.symmetric(
            horizontal: 50, vertical: 15), // Define el padding del botón.
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              10), // Define el radio de las esquinas del botón.
        ),
      ),
      child: Text(
        text!, // Texto que se mostrará en el botón. Esto causará un error ya que `text` es null.
        style: textStyle ??
            const TextStyle(
                color: Colors
                    .white), // Aplica el estilo de texto, si se proporciona.
      ),
    );
  }
}
