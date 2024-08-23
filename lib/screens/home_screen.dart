import 'package:demo_app/widgets/user_card.dart'; // Importa el widget UserCard.
import 'package:flutter/material.dart'; // Importa el paquete de Flutter para construir la interfaz de usuario.
import 'package:provider/provider.dart'; // Importa el paquete Provider para la gestión del estado.
import '../providers/card_color_provider.dart'; // Importa el proveedor de color de la tarjeta.
import '../widgets/transaction_list.dart'; // Importa el widget TransactionList.
import '../widgets/card_info.dart'; // Importa el widget CardInfo.
import 'contact_list_screen.dart'; // Importa la pantalla de lista de contactos.
import '../widgets/carousel_slider.dart'; // Importa el widget CarouselSlider.
import '../providers/financial_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    ContactListScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: Provider.of<CardColorProvider>(context).currentColor,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log Out'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'Contact',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const UserCard(),
        const SizedBox(height: 20),
        Consumer<CardColorProvider>(
          builder: (context, colorProvider, child) {
            return CarouselSlider(
              height: 200.0,
              items: colorProvider.colors.map((color) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      'Card',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
        Consumer<FinancialProvider>(
          builder: (context, financialProvider, child) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: CardInfo(
                      title: "Expence",
                      amount:
                          "\$${financialProvider.expense.toStringAsFixed(2)}",
                      color: Colors.redAccent,
                    ),
                  ),
                  Flexible(
                    child: CardInfo(
                      title: "Income",
                      amount:
                          "\$${financialProvider.income.toStringAsFixed(2)}",
                      color: Colors.green,
                    ),
                  ),
                  Flexible(
                    child: CardInfo(
                      title: "Balance",
                      amount:
                          "\$${financialProvider.balance.toStringAsFixed(2)}",
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            );
          },
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
            children: const [
              TransactionList(),
            ],
          ),
        ),
      ],
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log Out'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          // Puedes agregar más opciones de configuración aquí
        ],
      ),
    );
  }
}
