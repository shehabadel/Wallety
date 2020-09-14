import 'dart:async';
import 'dart:io';

class Wallet {
  String walletTitle;
  final double initialValue;
  double _currentValue;
  var transactionsList = new List();

  Wallet(this.initialValue, this.walletTitle) {
    var newFile = new File('$walletTitle.txt');
    //TODO read farah's assignment and implement opening file and appending Transaction data
    //TODO and read from a file the transaction data
  }
}
