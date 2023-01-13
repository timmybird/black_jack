import 'package:black_jack/card.dart';
import 'package:black_jack/deck.dart';

class Table {
  var numberOfDecks = 4;

  var unDealtCards = <Card>[];
  var discardPile = <Card>[];

  void reShuffle() {
    unDealtCards.addAll(discardPile);
    discardPile.clear();
    unDealtCards.shuffle();
  }

  void initUnDealtCards() {
    for (int i = 0; i < numberOfDecks; i++) {
      unDealtCards.addAll(Deck().cards);
    }
    unDealtCards.shuffle();
  }
}
