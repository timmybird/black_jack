import 'package:black_jack/hand_vizualizer.dart';
import 'package:flutter/material.dart';

import 'hand.dart';

class DealerHandVisualizer extends StatelessWidget {
  final Hand hand;

  const DealerHandVisualizer({Key? key, required this.hand}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Dealer\'s hand'),
        HandVisualizer(hand: hand),
      ],
    );
  }
}
