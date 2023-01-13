import 'package:black_jack/hand.dart';
import 'package:flutter/material.dart';

import 'hand_vizualizer.dart';

class PlayerHandVisualizer extends StatelessWidget {
  final Hand hand;
  const PlayerHandVisualizer({Key? key, required this.hand}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('Your hand'),
      HandVisualizer(hand: hand),
    ],);
  }
}
