class TransactionModel {
  final String id;
  final String description;
  final double amount;
  final bool isAddBalance;

  TransactionModel({
    required this.id,
    required this.description,
    required this.amount,
    required this.isAddBalance,
  });
}