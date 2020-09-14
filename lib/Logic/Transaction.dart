import 'dart:async';
import 'dart:io';

class Transaction {
  double _transactionValue;
  DateTime _transactionDate;
  String _transactionDesc;

  //Transaction Constructor
  Transaction(
      this._transactionValue, this._transactionDesc, this._transactionDate);

  void setTransValue(double transactionValue) {
    this._transactionValue = transactionValue;
  }

  double getTransValue() {
    return _transactionValue;
  }

  void setTransDate(DateTime transactionDate) {
    this._transactionDate = transactionDate;
  }

  String getTransDateString() {
    return '${_transactionDate.day}:${_transactionDate.month}:${_transactionDate.year}';
  }

  DateTime getTransDate() {
    return _transactionDate;
  }

  void setTransDesc(String transactionDesc) {
    this._transactionDesc = transactionDesc;
  }
}
