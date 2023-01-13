import 'package:black_jack/card.dart';
import 'package:black_jack/deck.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Deck contains 52 cards', (){
    final deck = Deck();
    expect(deck.cards.length, 52);
  });

  test('Deck contains 13 cards from each suit', () {
    final deck = Deck();
    expect(deck.cards.where((card) => card.suit == Suit.hearts).length, 13);
    expect(deck.cards.where((card) => card.suit == Suit.spades).length, 13);
    expect(deck.cards.where((card) => card.suit == Suit.diamonds).length, 13);
    expect(deck.cards.where((card) => card.suit == Suit.clubs).length, 13);
  });

  test('Deck contains four aces', () {
    final deck = Deck();
    expect(deck.cards.where((card) => card.rank == Rank.ace).length, 4);
  });
}