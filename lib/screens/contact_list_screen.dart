import 'package:flutter/material.dart'; // Importa el paquete de Flutter para construir la interfaz de usuario.
import 'package:http/http.dart'
    as http; // Importa el paquete http para realizar solicitudes HTTP.
import 'package:provider/provider.dart'; // Importa el paquete Provider para la gestión del estado.
import 'dart:convert'; // Importa el paquete dart:convert para trabajar con JSON.
import '../providers/send_money_provider.dart'; // Importa el proveedor de envío de dinero.
import 'send_money_screen.dart'; // Importa la pantalla de envío de dinero.

class ContactListScreen extends StatefulWidget {
  const ContactListScreen(
      {super.key}); // Constructor de la clase ContactListScreen.

  @override
  ContactListScreenState createState() =>
      ContactListScreenState(); // Crea el estado del widget.
}

class ContactListScreenState extends State<ContactListScreen> {
  final TextEditingController _searchController =
      TextEditingController(); // Controlador para el campo de búsqueda.
  List<dynamic> contacts = []; // Lista para almacenar los contactos.
  List<dynamic> filteredContacts =
      []; // Lista para almacenar los contactos filtrados.
  bool isLoading = true; // Variable para indicar si los datos están cargando.

  @override
  void initState() {
    super.initState();
    fetchContacts(); // Llama a la función para obtener los contactos cuando se inicializa el estado.
  }

  // Función para obtener los contactos desde una API.
  Future<void> fetchContacts() async {
    final response = await http.get(Uri.parse(
        'https://reqres.in/api/users?page=1&per_page=12')); // Realiza una solicitud GET a la API.
    if (response.statusCode == 200) {
      final data = json.decode(response.body); // Decodifica la respuesta JSON.
      setState(() {
        contacts =
            data['data']; // Asigna los datos de los contactos a la lista.
        filteredContacts =
            contacts; // Inicialmente, los contactos filtrados son los mismos que los contactos originales.
        isLoading = false; // Indica que la carga ha terminado.
      });
    } else {
      throw Exception(
          'Failed to load contacts'); // Lanza una excepción si la solicitud falla.
    }
  }

  // Función para filtrar los contactos según la consulta de búsqueda.
  void _filterContacts(String query) {
    setState(() {
      filteredContacts = contacts
          .where((contact) => '${contact['first_name']} ${contact['last_name']}'
              .toLowerCase()
              .contains(query
                  .toLowerCase())) // Filtra los contactos que contienen la consulta de búsqueda.
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child:
                  CircularProgressIndicator()) // Muestra un indicador de carga si los datos están cargando.
          : Column(
              children: [
                // Buscador
                Padding(
                  padding: const EdgeInsets.all(
                      8.0), // Padding alrededor del campo de búsqueda.
                  child: TextField(
                    controller:
                        _searchController, // Asigna el controlador al campo de búsqueda.
                    onChanged:
                        _filterContacts, // Llama a la función de filtrado cuando el texto cambia.
                    decoration: InputDecoration(
                      hintText: 'Search', // Texto de sugerencia.
                      prefixIcon:
                          const Icon(Icons.search), // Icono de búsqueda.
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(8.0), // Bordes redondeados.
                      ),
                    ),
                  ),
                ),
                // Carrusel estático de contactos
                SizedBox(
                  height: 100, // Altura del carrusel.
                  child: ListView.builder(
                    scrollDirection: Axis
                        .horizontal, // Dirección de desplazamiento horizontal.
                    itemCount: 5, // Número de elementos en el carrusel.
                    itemBuilder: (context, index) {
                      final contact = contacts[
                          index]; // Obtiene el contacto en la posición actual.
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0), // Padding horizontal.
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30, // Radio del avatar circular.
                              backgroundImage: NetworkImage(contact[
                                  'avatar']), // Imagen de fondo del avatar.
                            ),
                            const SizedBox(height: 5), // Espaciado vertical.
                            Text(
                                '${contact['first_name']}'), // Muestra el primer nombre del contacto.
                          ],
                        ),
                      );
                    },
                  ),
                ),
                // Lista de contactos
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredContacts
                        .length, // Número de elementos en la lista.
                    itemBuilder: (context, index) {
                      final contact = filteredContacts[
                          index]; // Obtiene el contacto filtrado en la posición actual.
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              contact['avatar']), // Imagen de fondo del avatar.
                        ),
                        title: Text(
                            '${contact['first_name']} ${contact['last_name']}'), // Muestra el nombre completo del contacto.
                        subtitle: Text(
                            contact['email']), // Muestra el email del contacto.
                        onTap: () {
                          // Configurar el Provider con los detalles del contacto seleccionado
                          Provider.of<SendMoneyProvider>(context, listen: false)
                              .setContactDetails(
                            '${contact['first_name']} ${contact['last_name']}', // Establece el nombre completo del contacto.
                            contact[
                                'email'], // Establece el email del contacto.
                            contact[
                                'avatar'], // Establece el avatar del contacto.
                          );

                          // Navegar a la pantalla de "Enviar Dinero"
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const SendMoneyScreen(), // Navega a la pantalla de envío de dinero.
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
