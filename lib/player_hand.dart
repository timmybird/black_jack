import 'package:black_jack/game.dart';
import 'package:black_jack/player_hand_visualizer.dart';
import 'package:flutter/material.dart';

class PlayerHand extends StatelessWidget {
  const PlayerHand({
    Key? key,
    required this.game,
  }) : super(key: key);

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PlayerHandVisualizer(hand: game.player.hand),
      ),
    );
  }
}
