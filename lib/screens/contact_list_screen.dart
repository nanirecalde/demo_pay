import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  ContactListScreenState createState() => ContactListScreenState();
}

class ContactListScreenState extends State<ContactListScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> contacts = [];
  List<dynamic> filteredContacts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchContacts();
  }

  Future<void> fetchContacts() async {
    final response = await http
        .get(Uri.parse('https://reqres.in/api/users?page=1&per_page=12'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        contacts = data['data'];
        filteredContacts = contacts;
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load contacts');
    }
  }

  void _filterContacts(String query) {
    setState(() {
      filteredContacts = contacts
          .where((contact) => '${contact['first_name']} ${contact['last_name']}'
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // Buscador
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _searchController,
                    onChanged: _filterContacts,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                // Carrusel estático de contactos
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      final contact = contacts[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(contact['avatar']),
                            ),
                            const SizedBox(height: 5),
                            Text('${contact['first_name']}'),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                // Lista de contactos
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredContacts.length,
                    itemBuilder: (context, index) {
                      final contact = filteredContacts[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(contact['avatar']),
                        ),
                        title: Text(
                            '${contact['first_name']} ${contact['last_name']}'),
                        subtitle: Text(contact['email']),
                        // trailing:
                        //     const Icon(Icons.check_circle, color: Colors.grey),
                        onTap: () {
                          // Acción al seleccionar un contacto
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
