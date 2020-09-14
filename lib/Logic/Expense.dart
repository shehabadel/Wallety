import 'package:wallety/Logic/Transaction.dart';

class Expense extends Transaction {
  static const assetImage = 'assets/images/Expense.png';

  Expense(
      double transactionValue, String transactionDesc, DateTime transactionDate)
      : super(transactionValue, transactionDesc, transactionDate);
}
