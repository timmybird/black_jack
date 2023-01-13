import 'package:black_jack/dealer_hand_visualizer.dart';
import 'package:black_jack/game.dart';
import 'package:flutter/material.dart';

class DealerHand extends StatelessWidget {
  const DealerHand({
    Key? key,
    required this.game,
  }) : super(key: key);

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DealerHandVisualizer(hand: game.dealer.hand),
      ),
    );
  }
}
