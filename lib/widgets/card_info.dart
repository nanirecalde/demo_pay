// Importa el paquete de Flutter para construir la interfaz de usuario.
import 'package:flutter/material.dart';

// Define una clase `CardInfo` que extiende `StatelessWidget`.
// Este widget representa una tarjeta de información con un título, una cantidad y un color.
class CardInfo extends StatelessWidget {
  // Propiedades finales que almacenan el título, la cantidad y el color de la tarjeta.
  final String title;
  final String amount;
  final Color color;

  // Constructor de la clase `CardInfo` que inicializa las propiedades con los valores proporcionados.
  // `title`, `amount` y `color` son requeridos.
  const CardInfo({
    super.key, // Inicializa la clave del widget.
    required this.title, // Inicializa la propiedad `title` con el valor proporcionado.
    required this.amount, // Inicializa la propiedad `amount` con el valor proporcionado.
    required this.color, // Inicializa la propiedad `color` con el valor proporcionado.
  });

  // Método `build` que describe cómo construir el widget en términos de otros widgets más bajos.
  @override
  Widget build(BuildContext context) {
    // Retorna un widget `Card` que proporciona una tarjeta con elevación.
    return Card(
      elevation: 4, // Define la elevación de la tarjeta.
      // Contenedor que envuelve el contenido de la tarjeta.
      child: Container(
        padding: const EdgeInsets.all(16.0), // Padding interno del contenedor.
        width: 130, // Ancho del contenedor.
        height: 100, // Altura del contenedor.
        // Decoración del contenedor.
        decoration: BoxDecoration(
          color: color.withOpacity(0.1), // Color de fondo con opacidad.
          borderRadius: BorderRadius.circular(10), // Bordes redondeados.
        ),
        // Columna para organizar los widgets verticalmente dentro del contenedor.
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Centra los widgets verticalmente.
          children: [
            // Texto que muestra el título.
            Text(
              title,
              style: const TextStyle(
                fontSize: 14.0, // Tamaño de fuente del título.
                fontWeight: FontWeight.bold, // Peso de fuente del título.
              ),
            ),
            const SizedBox(
                height: 8.0), // Espacio vertical entre el título y la cantidad.
            // Texto que muestra la cantidad.
            Text(
              amount,
              style: const TextStyle(
                fontSize: 16.0, // Tamaño de fuente de la cantidad.
                fontWeight: FontWeight.bold, // Peso de fuente de la cantidad.
              ),
            ),
          ],
        ),
      ),
    );
  }
}
