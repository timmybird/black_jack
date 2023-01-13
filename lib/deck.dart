import 'card.dart';

class Deck {
  late final List<Card> cards;

  Deck() {
    cards = _standardDeck;
  }

  void shuffle() {
    cards.shuffle();
  }

  List<Card> get _standardDeck {
    List<Card> generatedCards = [];
    for (var suit in Suit.values) {
      for (var rank in Rank.values) {
        generatedCards.add(Card(suit: suit, rank: rank));
      }
    }
    return generatedCards;
  }
}
