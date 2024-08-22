// Importa el paquete de Flutter para construir la interfaz de usuario.
import 'package:flutter/material.dart';
// Importa el modelo de transacción.
import '../models/transaction.dart';

// Define una clase `TransactionList` que extiende `StatelessWidget`.
// Este widget representa una lista de transacciones.
class TransactionList extends StatelessWidget {
  // Lista de transacciones que se mostrarán en la lista.
  final List<Transaction> transactions = [
    // Ejemplos de transacciones con diferentes propiedades.
    Transaction(
        name: "Netflux Premium",
        date: "August 20",
        amount: 12.99,
        isCredit: false),
    Transaction(
        name: "Gym Gold Membership",
        date: "August 15",
        amount: 29.99,
        isCredit: false),
    Transaction(
        name: "Caffeine Queen Coffee",
        date: "August 18",
        amount: 3.50,
        isCredit: false),
    Transaction(
        name: "Annual Book Club",
        date: "July 01",
        amount: 19.99,
        isCredit: false),
    Transaction(
        name: "Quick Ride Taxi Service",
        date: "August 19",
        amount: 15.75,
        isCredit: false),
    Transaction(
        name: "Healthy Groceries Delivery",
        date: "August 10",
        amount: 45.00,
        isCredit: false),
    Transaction(
        name: "Pineapple Streaming Music",
        date: "August 01",
        amount: 9.99,
        isCredit: false),
    Transaction(
        name: "Donate 4 More",
        date: "August 05",
        amount: 20.00,
        isCredit: true),
    Transaction(
        name: "Refund: Overspent at Cafe",
        date: "August 11",
        amount: 5.50,
        isCredit: true),
    Transaction(
        name: "BestSeats Event Tickets",
        date: "August 02",
        amount: 75.00,
        isCredit: false),
    Transaction(
        name: "Lucky Draw Lottery",
        date: "August 13",
        amount: 2.00,
        isCredit: false),
    Transaction(
        name: "Only Fans", date: "April 30", amount: 4.99, isCredit: false),
  ];

  // Constructor de la clase `TransactionList`.
  TransactionList({super.key});

  // Método `build` que describe cómo construir el widget en términos de otros widgets más bajos.
  @override
  Widget build(BuildContext context) {
    // Retorna un widget `ListView.builder` que construye una lista de widgets de manera perezosa.
    return ListView.builder(
      shrinkWrap: true, // Permite que la lista se ajuste a su contenido.
      physics:
          const NeverScrollableScrollPhysics(), // Desactiva el desplazamiento de la lista.
      itemCount: transactions.length, // Número de elementos en la lista.
      // Método que construye cada elemento de la lista.
      itemBuilder: (ctx, index) {
        // Obtiene la transacción en el índice actual.
        final tx = transactions[index];
        // Retorna un widget `ListTile` que representa una transacción.
        return ListTile(
          // Widget `CircleAvatar` que muestra un icono dentro de un círculo.
          leading: CircleAvatar(
            backgroundColor: tx.isCredit
                ? Colors.green
                : Colors
                    .red, // Color de fondo basado en el tipo de transacción.
            // Icono que indica si la transacción es un crédito o un débito.
            child:
                Icon(tx.isCredit ? Icons.arrow_downward : Icons.arrow_upward),
          ),
          // Título del `ListTile` que muestra el nombre de la transacción.
          title: Text(tx.name),
          // Subtítulo del `ListTile` que muestra la fecha de la transacción.
          subtitle: Text(tx.date),
          // Widget `Text` que muestra el monto de la transacción.
          trailing: Text(
            '${tx.isCredit ? '+' : '-'}\$${tx.amount.toStringAsFixed(2)}', // Formato del monto con signo y dos decimales.
            // Estilo del texto del monto.
            style: TextStyle(
              color: tx.isCredit
                  ? Colors.green
                  : Colors
                      .red, // Color del texto basado en el tipo de transacción.
              fontWeight: FontWeight.bold, // Peso de la fuente en negrita.
            ),
          ),
        );
      },
    );
  }
}
