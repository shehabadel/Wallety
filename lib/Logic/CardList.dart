import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:wallety/UI/components/CardDetails.dart';

//The main model provider

class CardList with ChangeNotifier {
  double currentValue = 4500.0;

  List<Widget> cardList = [
    CardDetails("Macdonalds", "11-12-2020", 400.0, "Expense"),
    CardDetails("Gas", "14-11-2020", 100.0, "Expense"),
    CardDetails("Groceries", "18-1-2020", 700.0, "Expense"),
    CardDetails("Month's Salary", "14-11-2020", 8000.0, "Income"),
    CardDetails("Gam3eya", "18-1-2020", 2000.0, "Income"),
    CardDetails("Ice-cream", "19-12-2020", 100.0, "Expense"),
    CardDetails("Gam3eya", "18-1-2020", 2000, "Income"),
    CardDetails("Ice-cream", "19-12-2020", 100.0, "Expense"),
    CardDetails("Gam3eya", "18-1-2020", 2000.0, "Income"),
    CardDetails("Ice-cream", "19-12-2020", 100, "Expense"),
    CardDetails("Macdonalds", "19-12-2020", 800, "Expense")
  ];

  double calculateCurrentValue(List<CardDetails> cardList) {}
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

  String saveData() {
    String savedData = "";
    //Saving data as String with currentValue
    //there might be a logical error here
    //think about calculation total incomes and subtract it from total expenses
    //TODO focus&find a solution for that currentValue
    for (CardDetails card in cardList) {
      savedData += "${card.toStringS()}, currentValue:$currentValue\n";
    }
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
