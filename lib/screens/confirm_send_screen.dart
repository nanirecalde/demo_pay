// screens/confirm_send_screen.dart
import 'package:flutter/material.dart';

class ConfirmSendScreen extends StatelessWidget {
  final double amount;
  final VoidCallback onConfirmed;

  const ConfirmSendScreen({
    super.key,
    required this.amount,
    required this.onConfirmed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirm Send'),
      content:
          Text('Are you sure you want to send \$${amount.toStringAsFixed(2)}?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context), // Cierra el diálogo
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Cierra el diálogo
            onConfirmed(); // Ejecuta el callback al confirmar
          },
          child: const Text('Send'),
        ),
      ],
    );
  }
}
