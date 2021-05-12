import 'package:wallety/Logic/Transaction.dart';
import 'package:flutter/foundation.dart';

class Model {
  List<TransactionW> transList;
  double currentValue = 0;

  Model(List<TransactionW> translist) {
    this.transList = transList;
  }

  void calculateCV() {
    transList.forEach((transaction) {
      if ((currentValue < transaction.transValue) &
          (transaction.transType == TransactionType.Expense)) {
        print("Can't be added");
      }
      if (transaction.transType == TransactionType.Income) {
        currentValue += transaction.transValue;
      } else if (transaction.transType == TransactionType.Expense) {
        currentValue -= transaction.transValue;
      }
    });
  }
}
