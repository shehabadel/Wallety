import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:wallety/UI/CardDetails.dart';

//The main model provider

class CardList with ChangeNotifier {
  double currentValue = 300.0;

  List<Widget> cardList = [
    CardDetails("Macdonalds", "14-12-2040 3:00PM", "400", "Expense"),
    CardDetails("Gas", "14-12-2040 2:00PM", "100", "Expense"),
    CardDetails("Groceries", "12-1-2040", "700", "Expense"),
    CardDetails("Macdonalds", "14-13-2040", "800", "Expense")
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

  void reset() {
    cardList.clear();
    currentValue = 0.0;
    notifyListeners();
  }
}
