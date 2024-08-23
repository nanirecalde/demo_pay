// screens/reject_send_screen.dart
import 'package:flutter/material.dart';

class RejectSendScreen extends StatelessWidget {
  final double amount;
  final double balance;
  final String reason; // Nueva razón de rechazo

  const RejectSendScreen({
    super.key,
    required this.amount,
    required this.balance,
    required this.reason, // Inicializar la razón
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Transaction Rejected'),
      content: Text(reason), // Mostrar la razón de rechazo
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context), // Cierra el diálogo
          child: const Text('OK'),
        ),
      ],
    );
  }
}
