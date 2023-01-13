import 'package:black_jack/dealer.dart';
import 'package:black_jack/extensions.dart';
import 'package:black_jack/hand.dart';
import 'package:black_jack/player.dart';
import 'package:black_jack/table.dart';

class Game {
  var table = Table();
  var dealer = Dealer();
  var player = Player();

  bool isPush(Hand hand) {
    if (hand.isBlackJack && dealer.hand.isBlackJack) return true;
    if (hand.value == dealer.hand.value) return true;
    return false;
  }

  bool isWinner(Hand hand) {
    if (hand.isBust) return false;
    if (dealer.hand.isBust) return true;
    if (hand.value > dealer.hand.value) return true;
    return false;
  }

  bool isLoser(Hand hand) {
    if (hand.isBust) return true;
    if (!dealer.hand.isBust && dealer.hand.value > hand.value) return true;
    return false;
  }

  void hit(Hand hand) {
    hand.cards.add(table.unDealtCards.pop());
  }

  void initialDeal() {
    player.hand.isStand = false;
    dealer.hand.isStand = false;
    hit(player.hand);
    hit(dealer.hand);
    hit(player.hand);
  }

  bool get isOver {
    if (player.hand.isBust) return true;
    if (dealer.hand.isBust) return true;
    if (dealer.isStand && player.hand.isDone) return true;
    return false;
  }

  void reset() {
    table.discardPile.addAll(player.hand.cards);
    player.hand.cards.clear();
    table.discardPile.addAll(dealer.hand.cards);
    dealer.hand.cards.clear();

    if (table.unDealtCards.length < 22) {
      table.reShuffle();
    }
    initialDeal();
  }
}
