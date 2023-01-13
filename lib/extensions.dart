import 'card.dart';

extension ListExtensions on List<Card> {
  Card pop() {
    var card = first;
    remove(card);
    return card;
  }
}