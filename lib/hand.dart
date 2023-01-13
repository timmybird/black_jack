import 'card.dart';

class Hand {
  final List<Card> cards = [];
  bool isStand = false;

  int get value {
    int value = 0;
    var nonAces = cards.where((card) => card.rank != Rank.ace);
    var aces = cards.where((card) => card.rank == Rank.ace);
    for (var card in nonAces) {
      value += card.values[0];
    }
    for (var _ in aces) {
      if (value + 11 <= 21) {
        value += 11;
      } else {
        value += 1;
      }
    }
    return value;
  }

  bool isBetterThan(Hand otherHand) {
    if (isBust) {
      return false;
    }
    if (otherHand.isBust) {
      return true;
    }
    if (isBlackJack && otherHand.isBlackJack) {
      return false;
    }
    if (isBlackJack && !otherHand.isBlackJack) {
      return true;
    }
    return value > otherHand.value;
  }

  bool get isBust => value > 21;

  bool get isBlackJack => value == 21 && cards.length == 2;

  bool get isDone => isStand == true || value == 21 || isBust;

  void doStand() => isStand = true;


}
