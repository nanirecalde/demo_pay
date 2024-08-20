class Transaction {
  final String name;
  final String date;
  final double amount;
  final bool isCredit;

  Transaction({
    required this.name,
    required this.date,
    required this.amount,
    required this.isCredit,
  });
}
