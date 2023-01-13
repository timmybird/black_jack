import 'package:black_jack/main.dart';
import 'package:flutter/material.dart';

import 'game.dart';

class WinnerDisplay extends StatelessWidget {
  final Winner winner;
  final Game game;
  const WinnerDisplay({Key? key, required this.winner, required this.game}) : super(key: key);

  String get winnerText {
    switch (winner) {
      case Winner.player:
        return "You win!";
      case Winner.dealer:
        return "Dealer wins";
      case Winner.push:
        return "It's a push.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: game.isOver ? Text(winnerText) : null,
    );
  }
}
