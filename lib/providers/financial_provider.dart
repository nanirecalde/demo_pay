import 'package:flutter/material.dart';
import '../models/transaction.dart';

class FinancialProvider with ChangeNotifier {
  double _income = 3897.00;
  double _expense = 4264.00;
  double _balance = 5156.00;

  // Lista inicial de transacciones con datos falsos
  final List<Transaction> _transactions = [
    Transaction(
        name: "Only Fans",
        date: "February 30, 2024",
        amount: 200.00,
        isCredit: false),
    Transaction(
        name: "Rent",
        date: "January 30, 2024",
        amount: 800.00,
        isCredit: false),
    Transaction(
        name: "Salary",
        date: "January 15, 2024",
        amount: 2000.00,
        isCredit: true),
    Transaction(
        name: "Groceries",
        date: "January 03, 2024",
        amount: 150.75,
        isCredit: false),
    Transaction(
        name: "Initial Deposit",
        date: "January 01, 2024",
        amount: 5000.00,
        isCredit: true),
  ];

  double get income => _income;
  double get expense => _expense;
  double get balance => _balance;
  List<Transaction> get transactions => _transactions;

  void addIncome(double amount) {
    _income += amount;
    _balance += amount;
    notifyListeners();
  }

  void addExpense(double amount) {
    _expense += amount;
    _balance -= amount;
    notifyListeners();
  }

  void addTransaction(Transaction transaction) {
    _transactions.insert(0,
        transaction); // Inserta la nueva transacción al principio de la lista
    notifyListeners();
  }
}
