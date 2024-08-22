// Importa los paquetes necesarios de Flutter y Provider.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Importa el proveedor de color de tarjeta.
import '../providers/card_color_provider.dart';

// Define una clase `CarouselSlider` que extiende `StatefulWidget`.
// Este widget representa un carrusel deslizante de elementos.
class CarouselSlider extends StatefulWidget {
  // Propiedades finales que almacenan los elementos del carrusel y la altura del carrusel.
  final List<Widget> items;
  final double height;

  // Constructor de la clase `CarouselSlider` que inicializa las propiedades con los valores proporcionados.
  // `items` y `height` son requeridos.
  const CarouselSlider({super.key, required this.items, required this.height});

  // Crea el estado asociado a este widget.
  @override
  State<CarouselSlider> createState() => _CarouselSliderState();
}

// Define la clase `_CarouselSliderState` que extiende `State<CarouselSlider>`.
// Esta clase maneja el estado del widget `CarouselSlider`.
class _CarouselSliderState extends State<CarouselSlider> {
  // Controlador de página para manejar el desplazamiento entre páginas.
  final PageController _pageController = PageController(initialPage: 0);

  // Método `dispose` que se llama cuando el widget se elimina del árbol de widgets.
  // Libera los recursos utilizados por el controlador de página.
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Método `build` que describe cómo construir el widget en términos de otros widgets más bajos.
  @override
  Widget build(BuildContext context) {
    // Retorna un widget `SizedBox` que envuelve el `PageView.builder`.
    return SizedBox(
      height: widget.height, // Establece la altura del carrusel.
      // `PageView.builder` permite la creación perezosa de páginas.
      child: PageView.builder(
        controller: _pageController, // Asigna el controlador de página.
        // Método que se llama cuando se cambia la página.
        onPageChanged: (index) {
          // Obtiene el proveedor de color de tarjeta sin escuchar cambios.
          final colorProvider =
              Provider.of<CardColorProvider>(context, listen: false);
          // Cambia el color de la tarjeta basado en el índice de la página.
          colorProvider.changeColor(index % widget.items.length);
        },
        // Método que construye cada página del `PageView`.
        itemBuilder: (context, index) {
          // Retorna el widget correspondiente al índice actual.
          return widget.items[index % widget.items.length];
        },
      ),
    );
  }
}
