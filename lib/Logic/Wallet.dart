import 'dart:async';
import 'dart:html';
import 'dart:io';

import 'package:wallety/Logic/Expense.dart';
import 'package:wallety/Logic/Income.dart';

class Wallet {
  final double initialValue;
  double _currentValue;
  var transactionsList = new List();

  Wallet(this.initialValue) {
    _currentValue = this.initialValue;
    //TODO read farah's assignment and implement opening file and appending Transaction data
    //TODO and read from a file the transaction data
  }
  void decrementValue(Expense expense) {
    _currentValue -= expense.getTransValue();
  }

  void IncrementValue(Income income) {
    _currentValue += income.getTransValue();
  }
}
