class TransactionW {
  int transID;
  TransactionType transType;
  String transTitle;
  String transDesc;
  DateTime transDate;
  double transValue;

  TransactionW(
      {String transType,
      String transTitle,
      String transDesc,
      DateTime transDate,
      double transValue});
  Map<String, dynamic> toMap() {
    return {
      'id': transID,
      'type': transType,
      'title': transTitle,
      'value': transValue,
      'description': transDesc,
      'date': transDate,
    };
  }

  TransactionW.fromMap(Map<String, dynamic> map) {
    transID = map['id'];
    transType = map['type'];
    transTitle = map['title'];
    transValue = map['value'];
    transDesc = map['description'];
    transDate = map['date'];
  }
}

enum TransactionType { Expense, Income }
