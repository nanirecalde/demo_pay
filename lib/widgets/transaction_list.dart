import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions = [
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

  TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: transactions.length,
      itemBuilder: (ctx, index) {
        final tx = transactions[index];
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
