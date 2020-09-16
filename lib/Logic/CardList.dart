import 'package:wallety/UI/CardDetails.dart';

class CardList {
  List<CardDetails> cardList = new List();

  void addCard(CardDetails card) {
    cardList.add(card);
  }

  List<CardDetails> getCardList() {
    return cardList;
  }
}
