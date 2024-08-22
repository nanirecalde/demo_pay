import 'package:flutter/material.dart'; // Importa el paquete de Flutter para construir la interfaz de usuario.
import 'package:provider/provider.dart'; // Importa el paquete Provider para la gestión del estado.
import '../providers/send_money_provider.dart'; // Importa el proveedor de envío de dinero.

class SendMoneyScreen extends StatelessWidget {
  const SendMoneyScreen(
      {super.key}); // Constructor de la clase SendMoneyScreen.

  @override
  Widget build(BuildContext context) {
    final sendMoneyProvider = Provider.of<SendMoneyProvider>(
        context); // Obtiene una instancia del proveedor de envío de dinero.

    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Money'), // Título de la AppBar.
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Icono de flecha hacia atrás.
          onPressed: () {
            Navigator.pop(
                context); // Navega hacia atrás en la pila de navegación.
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding alrededor del cuerpo.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .center, // Alinea los hijos al centro horizontalmente.
          children: [
            CircleAvatar(
              radius: 30, // Radio del avatar circular.
              backgroundImage: NetworkImage(sendMoneyProvider
                  .contactAvatar), // Imagen de fondo del avatar.
            ),
            const SizedBox(height: 10), // Espaciado vertical.
            Text(
              sendMoneyProvider.contactName, // Nombre del contacto.
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold), // Estilo del texto.
            ),
            Text(
              'AC: ${sendMoneyProvider.contactAccount}', // Cuenta del contacto.
              style: const TextStyle(color: Colors.grey), // Estilo del texto.
            ),
            const SizedBox(height: 20), // Espaciado vertical.
            Text(
              '\$${sendMoneyProvider.amount.toStringAsFixed(2)}', // Monto a enviar.
              style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold), // Estilo del texto.
            ),
            const SizedBox(height: 20), // Espaciado vertical.
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Número de columnas en la cuadrícula.
                  childAspectRatio: 2, // Relación de aspecto de los hijos.
                ),
                itemCount: 12, // Número de elementos en la cuadrícula.
                itemBuilder: (context, index) {
                  if (index == 9) {
                    return const SizedBox
                        .shrink(); // Espacio vacío en la posición 9.
                  } else if (index == 10) {
                    return GestureDetector(
                      onTap: () {
                        sendMoneyProvider
                            .updateAmount(0); // Actualiza el monto a 0.
                      },
                      child: Container(
                        alignment:
                            Alignment.center, // Alinea el contenido al centro.
                        child: const Text(
                          '0', // Texto del botón.
                          style: TextStyle(fontSize: 24), // Estilo del texto.
                        ),
                      ),
                    );
                  } else if (index == 11) {
                    return GestureDetector(
                      onTap: () {
                        sendMoneyProvider.updateAmount(
                          double.parse(
                            sendMoneyProvider.amount.toString().substring(
                                0,
                                sendMoneyProvider.amount.toString().length -
                                    1), // Elimina el último dígito del monto.
                          ),
                        );
                      },
                      child: const Icon(Icons.backspace), // Icono de retroceso.
                    );
                  } else {
                    return GestureDetector(
                      onTap: () {
                        final number =
                            index + 1; // Calcula el número basado en el índice.
                        sendMoneyProvider.updateAmount(
                          sendMoneyProvider.amount * 10 +
                              number, // Actualiza el monto.
                        );
                      },
                      child: Container(
                        alignment:
                            Alignment.center, // Alinea el contenido al centro.
                        child: Text(
                          '${index + 1}', // Texto del botón.
                          style: const TextStyle(
                              fontSize: 24), // Estilo del texto.
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Lógica para continuar
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange, // Color de fondo del botón.
                minimumSize:
                    const Size.fromHeight(50), // Tamaño mínimo del botón.
              ),
              child: const Text(
                'Continue', // Texto del botón.
                style: TextStyle(fontSize: 18), // Estilo del texto.
              ),
            ),
          ],
        ),
      ),
    );
  }
}
