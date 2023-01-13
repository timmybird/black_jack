import 'package:black_jack/extensions.dart';
import 'package:black_jack/hand.dart';
import 'package:black_jack/table.dart';

class Dealer {
  var hand = Hand();

  bool get isStand => hand.value >= 17;

  bool get isDone => isStand || hand.isDone;
}
