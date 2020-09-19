import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:wallety/UI/CardDetails.dart';
import 'package:wallety/Logic/Expense.dart';
import 'package:wallety/Logic/Income.dart';

//The main model provider

class CardList with ChangeNotifier {
  double currentValue = 300.0;

  List<Widget> cardList = [
    CardDetails("Macdonalds", "14-12-2040 3:00PM", "400"),
    CardDetails("Gas", "14-12-2040 2:00PM", "100"),
    CardDetails("Groceries", "12-1-2040", "700"),
    CardDetails("Macdonalds", "14-13-2040", "800")
  ];

  void addCard(CardDetails card) {
    cardList.add(card);
    notifyListeners();
  }

  double getCurrentValue() {
    return this.currentValue;
  }

  List<Widget> getCardList() {
    return cardList;
  }

  void decrementValue(double amount) {
    currentValue -= amount;
    notifyListeners();
  }

  void incrementValue(double amount) {
    currentValue += amount;
    notifyListeners();
  }
}
