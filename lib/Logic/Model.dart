import 'package:wallety/Logic/Transaction.dart';

//TODO must retrieve transList, currentValue from sembast Database
class Model {
  List<Transaction> transList;
  double currentValue = 0;

  void addTransaction(Transaction transaction) {}
  void deleteTransaction() {}
  void updateTransaction() {}
  void incrementCV(double value) {}
  void decrementCV(double value) {}
}
