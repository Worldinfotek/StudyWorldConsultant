class InstallmentModel {
  final int number;
  final String description;
  final String dueDate;
  final double amount;
  final String currency;
  final double exchangeRate;
  final double totalPkr;
  final String payment;
  final String status;

  const InstallmentModel({
    required this.number,
    required this.description,
    required this.dueDate,
    required this.amount,
    required this.currency,
    required this.exchangeRate,
    required this.totalPkr,
    required this.payment,
    required this.status,
  });
}