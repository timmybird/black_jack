import 'package:black_jack/card.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Three has a value of 3', () {
    const card = Card(suit: Suit.hearts, rank: Rank.three);
    expect(card.values, [3]);
  });

  test('King has a value of 10', () {
    const card = Card(suit: Suit.hearts, rank: Rank.king);
    expect(card.values, [10]);
  });

  test('Ace has values 1 & 11', () {
    const card = Card(suit: Suit.hearts, rank: Rank.ace);
    expect(card.values, [1, 11]);
  });

  test('Ace has values 1 & 11', () {
    const card = Card(suit: Suit.hearts, rank: Rank.ace);
    expect(card.values, [1, 11]);
  });

  test('toString returns correct suit and rank', () {
    const card = Card(suit: Suit.hearts, rank: Rank.ace);
    expect(card.toString(), '♥A');
  });
}