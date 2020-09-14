import 'package:wallety/Logic/Transaction.dart';

class Income extends Transaction {
  static const assetImage = 'assets/images/Income.png';

  Income(double transactionValue, String transactionDesc,
      DateTime transactionDate)
      : super(transactionValue, transactionDesc, transactionDate);
}