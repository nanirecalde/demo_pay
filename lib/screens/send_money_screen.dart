import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/send_money_provider.dart';
import '../providers/financial_provider.dart';
import '../models/transaction.dart';
import '../widgets/custom_keyboard.dart';
import 'confirm_send_screen.dart';
import 'reject_send_screen.dart';

class SendMoneyScreen extends StatelessWidget {
  const SendMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sendMoneyProvider = Provider.of<SendMoneyProvider>(context);
    final financialProvider = Provider.of<FinancialProvider>(context);

    void handleKeyPress(String key) {
      if (key == '<') {
        sendMoneyProvider.deleteLastDigit();
      } else if (key == '.') {
        sendMoneyProvider.addDecimal();
      } else {
        sendMoneyProvider.addDigit(key);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Money'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            sendMoneyProvider.reset(); // Resetea el monto al regresar
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(sendMoneyProvider.contactAvatar),
            ),
            const SizedBox(height: 10),
            Text(
              sendMoneyProvider.contactName,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'AC: ${sendMoneyProvider.contactAccount}',
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Text(
              sendMoneyProvider.amountString,
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: CustomKeyboard(onKeyPressed: handleKeyPress),
            ),
            ElevatedButton(
              onPressed: () {
                final double amountToSend = sendMoneyProvider.amount;
                final double currentBalance = financialProvider.balance;

                // Validar si el monto es menor que $2
                if (amountToSend < 2.0) {
                  // Mostrar pantalla de rechazo si el monto es menor que $2
                  showDialog(
                    context: context,
                    builder: (context) => RejectSendScreen(
                      amount: amountToSend,
                      balance: currentBalance,
                      reason: 'The minimum amount you can send is \$2.00.',
                    ),
                  );
                }
                // Validar si el monto supera el balance
                else if (amountToSend > currentBalance) {
                  // Mostrar pantalla de rechazo si el monto es mayor que el balance disponible
                  showDialog(
                    context: context,
                    builder: (context) => RejectSendScreen(
                      amount: amountToSend,
                      balance: currentBalance,
                      reason:
                          'Insufficient balance to complete the transaction.',
                    ),
                  );
                } else {
                  // Formatear la fecha
                  final String formattedDate =
                      DateFormat('MMMM dd, yyyy').format(DateTime.now());

                  // Crear una nueva transacción
                  final newTransaction = Transaction(
                    name: sendMoneyProvider.contactName,
                    date: formattedDate, // Fecha formateada
                    amount: sendMoneyProvider.amount,
                    isCredit: false,
                  );

                  // Mostrar la pantalla de confirmación
                  showDialog(
                    context: context,
                    builder: (context) => ConfirmSendScreen(
                      amount: sendMoneyProvider.amount,
                      onConfirmed: () {
                        // Actualizar los valores financieros
                        financialProvider.addExpense(sendMoneyProvider.amount);

                        // Agregar la nueva transacción al historial
                        financialProvider.addTransaction(newTransaction);

                        // Resetea el formulario después de enviar dinero
                        sendMoneyProvider.reset();

                        // Navegar a la pantalla de éxito
                        Navigator.pushReplacementNamed(context, '/success');
                      },
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text(
                'Continue',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
