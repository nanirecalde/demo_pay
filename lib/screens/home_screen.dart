import 'package:demo_app/widgets/user_card.dart'; // Importa el widget UserCard.
import 'package:flutter/material.dart'; // Importa el paquete de Flutter para construir la interfaz de usuario.
import 'package:provider/provider.dart'; // Importa el paquete Provider para la gestión del estado.
import '../providers/card_color_provider.dart'; // Importa el proveedor de color de la tarjeta.
import '../widgets/transaction_list.dart'; // Importa el widget TransactionList.
import '../widgets/card_info.dart'; // Importa el widget CardInfo.
import 'contact_list_screen.dart'; // Importa la pantalla de lista de contactos.
import '../widgets/carousel_slider.dart'; // Importa el widget CarouselSlider.

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key}); // Constructor de la clase HomeScreen.

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() =>
      _HomeScreenState(); // Crea el estado del widget.
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex =
      0; // Variable para almacenar el índice del elemento seleccionado en la barra de navegación inferior.

  // Lista de widgets que se mostrarán según el índice seleccionado.
  static const List<Widget> _widgetOptions = <Widget>[
    HomeContent(), // Contenido de la pantalla principal.
    ContactListScreen(), // Pantalla de lista de contactos.
    Center(
        child: Text('Settings Screen',
            style: TextStyle(fontSize: 24))), // Pantalla de configuración.
  ];

  // Método que se llama cuando se selecciona un elemento en la barra de navegación inferior.
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Actualiza el índice seleccionado.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'), // Título de la AppBar.
        // Hace que el color de la AppBar coincida con el color de la tarjeta usando el proveedor de estado.
        backgroundColor: Provider.of<CardColorProvider>(context).currentColor,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, // Elimina el padding predeterminado.
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue, // Color de fondo del encabezado del Drawer.
              ),
              child: Text(
                'Menu', // Texto del encabezado del Drawer.
                style: TextStyle(
                  color: Colors.white, // Color del texto.
                  fontSize: 24, // Tamaño de la fuente.
                ),
              ),
            ),
            ListTile(
              leading:
                  const Icon(Icons.logout), // Icono del elemento de la lista.
              title: const Text('Log Out'), // Texto del elemento de la lista.
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, '/'); // Navega a la pantalla de inicio de sesión.
              },
            ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(
          _selectedIndex), // Muestra el widget correspondiente al índice seleccionado.
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
                Icons.home), // Icono del elemento de la barra de navegación.
            label: 'Home', // Etiqueta del elemento de la barra de navegación.
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons
                .contacts), // Icono del elemento de la barra de navegación.
            label:
                'Contact', // Etiqueta del elemento de la barra de navegación.
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons
                .settings), // Icono del elemento de la barra de navegación.
            label:
                'Settings', // Etiqueta del elemento de la barra de navegación.
          ),
        ],
        currentIndex: _selectedIndex, // Índice del elemento seleccionado.
        selectedItemColor: Colors.blue, // Color del elemento seleccionado.
        onTap:
            _onItemTapped, // Llama al método _onItemTapped cuando se selecciona un elemento.
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key}); // Constructor de la clase HomeContent.

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20), // Espaciado vertical.
        const UserCard(), // Muestra el widget UserCard.
        const SizedBox(height: 20), // Espaciado vertical.
        Consumer<CardColorProvider>(
          builder: (context, colorProvider, child) {
            return CarouselSlider(
              height: 200.0, // Altura del carrusel.
              items: colorProvider.colors.map((color) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 5.0), // Margen horizontal.
                  decoration: BoxDecoration(
                    color: color, // Color de fondo del contenedor.
                    borderRadius:
                        BorderRadius.circular(20), // Bordes redondeados.
                  ),
                  child: const Center(
                    child: Text(
                      'Card', // Texto dentro del contenedor.
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0), // Estilo del texto.
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
        const Padding(
          padding: EdgeInsets.all(16.0), // Padding alrededor del contenido.
          child: Row(
            mainAxisAlignment: MainAxisAlignment
                .spaceBetween, // Distribuye los hijos con espacio entre ellos.
            children: [
              CardInfo(
                  title: "Expence",
                  amount: "\$4,264",
                  color: Colors.redAccent), // Muestra información de gastos.
              CardInfo(
                  title: "Income",
                  amount: "\$3,897",
                  color: Colors.green), // Muestra información de ingresos.
              CardInfo(
                  title: "Balance",
                  amount: "\$5,156",
                  color: Colors.blue), // Muestra información del balance.
            ],
          ),
        ),
        const Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 16.0), // Padding horizontal.
          child: Align(
            alignment: Alignment.centerLeft, // Alinea el texto a la izquierda.
            child: Text(
              'Transactions', // Título de la sección de transacciones.
              style: TextStyle(
                fontSize: 20, // Tamaño de la fuente.
                fontWeight: FontWeight.bold, // Peso de la fuente.
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              TransactionList(), // Muestra la lista de transacciones.
            ],
          ),
        ),
      ],
    );
  }
}
