import 'package:black_jack/card.dart';
import 'package:black_jack/hand.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Hand with card two has a value of 2', () {
    final hand = Hand();
    hand.cards.add(const Card(suit: Suit.hearts, rank: Rank.two));
    expect(hand.value, 2);
  });

  test('Hand with cards two and three has a value of 5', () {
    final hand = Hand();
    hand.cards.addAll([const Card(suit: Suit.hearts, rank: Rank.two), const Card(suit: Suit.diamonds, rank: Rank.three)]);
    expect(hand.value, 5);
  });

  test('Hand with ace has value of 11', () {
    final hand = Hand();
    hand.cards.addAll([const Card(suit: Suit.hearts, rank: Rank.ace)]);
    expect(hand.value, 11);
  });

  test('Hand with ace has value of 12', () {
    final hand = Hand();
    hand.cards.addAll([const Card(suit: Suit.hearts, rank: Rank.ace), const Card(suit: Suit.hearts, rank: Rank.ace)]);
    expect(hand.value, 12);
  });

  test('Hand with ace has value of 13', () {
    final hand = Hand();
    hand.cards.addAll([
      const Card(suit: Suit.hearts, rank: Rank.ace),
      const Card(suit: Suit.hearts, rank: Rank.ace),
      const Card(suit: Suit.hearts, rank: Rank.ace)
    ]);
    expect(hand.value, 13);
  });

  test('Hand with with value larger than 21 is is bust', () {
    final hand = Hand();
    hand.cards.addAll([
      const Card(suit: Suit.hearts, rank: Rank.jack),
      const Card(suit: Suit.hearts, rank: Rank.queen),
    ]);

    expect(hand.isBust, false);

    hand.cards.add(const Card(suit: Suit.hearts, rank: Rank.king));

    expect(hand.isBust, true);
  });

  test('Hand consisting of two cards and with a value of 21 is blackjack', () {
    final hand = Hand();
    hand.cards.addAll([
      const Card(suit: Suit.hearts, rank: Rank.jack),
    ]);

    expect(hand.isBlackJack, false);

    hand.cards.add(const Card(suit: Suit.hearts, rank: Rank.ace));

    expect(hand.isBlackJack, true);
  });

  test('Hand consisting of more than two cards and with a value of 21 is not blackjack', () {
    final hand = Hand();
    hand.cards.addAll([
      const Card(suit: Suit.hearts, rank: Rank.three),
      const Card(suit: Suit.hearts, rank: Rank.five),
    ]);

    expect(hand.isBlackJack, false);

    hand.cards.add(const Card(suit: Suit.hearts, rank: Rank.ace));

    expect(hand.isBlackJack, true);
  });

}
