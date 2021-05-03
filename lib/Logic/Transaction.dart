class Transaction {
  TransactionType transType;
  String transTitle;
  String transDesc;
  DateTime transDate;
  double transValue;

  Transaction(
      {String transType,
      String transTitle,
      String transDesc,
      DateTime transDate,
      double transValue});
}

enum TransactionType { Expense, Income }
