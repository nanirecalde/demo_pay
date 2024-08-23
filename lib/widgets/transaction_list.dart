import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/financial_provider.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    final financialProvider = Provider.of<FinancialProvider>(context);

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: financialProvider.transactions.length,
      itemBuilder: (ctx, index) {
        // Accedemos a las transacciones en orden inverso
        final tx = financialProvider.transactions[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: tx.isCredit ? Colors.green : Colors.red,
            child:
                Icon(tx.isCredit ? Icons.arrow_downward : Icons.arrow_upward),
          ),
          title: Text(tx.name),
          subtitle: Text(tx.date),
          trailing: Text(
            '${tx.isCredit ? '+' : '-'}\$${tx.amount.toStringAsFixed(2)}',
            style: TextStyle(
              color: tx.isCredit ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}
