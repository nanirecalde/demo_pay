// Importa el paquete de Flutter para construir la interfaz de usuario.
import 'package:flutter/material.dart';

// Define una clase `UserCard` que extiende `StatelessWidget`.
// Este widget representa una tarjeta de usuario con un saludo y una imagen de perfil.
class UserCard extends StatelessWidget {
  // Constructor de la clase `UserCard`.
  const UserCard({super.key});

  // Método `build` que describe cómo construir el widget en términos de otros widgets más bajos.
  @override
  Widget build(BuildContext context) {
    // Retorna un widget `Container` que envuelve el contenido de la tarjeta.
    return Container(
      padding: const EdgeInsets.all(16.0), // Padding interno del contenedor.
      width: 380, // Ancho del contenedor.
      // Decoración del contenedor.
      decoration: BoxDecoration(
        color: const Color.fromARGB(
            255, 186, 186, 186), // Color de fondo del contenedor.
        borderRadius:
            BorderRadius.circular(20), // Bordes redondeados del contenedor.
      ),
      // Widget `Row` para organizar los widgets horizontalmente.
      child: const Row(
        mainAxisAlignment: MainAxisAlignment
            .spaceBetween, // Distribuye el espacio entre los widgets hijos.
        children: [
          // Widget `Column` para organizar los widgets verticalmente.
          Column(
            crossAxisAlignment: CrossAxisAlignment
                .start, // Alinea los widgets hijos al inicio horizontalmente.
            children: [
              // Widget `Text` que muestra un saludo.
              Text(
                'Hello Sami', // Texto del saludo.
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold), // Estilo del texto.
              ),
            ],
          ),
          // Widget `CircleAvatar` que muestra una imagen de perfil dentro de un círculo.
          CircleAvatar(
            radius: 25, // Radio del avatar circular.
            backgroundImage: NetworkImage(
                'https://reqres.in/img/faces/4-image.jpg'), // URL de la imagen de perfil.
          ),
        ],
      ),
    );
  }
}
