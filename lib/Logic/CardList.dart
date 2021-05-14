import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:wallety/UI/components/CardDetails.dart';

//The main model provider

class CardList with ChangeNotifier {
  double currentValue = 4500.0;

  List<Widget> cardList = [];

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
