import 'package:black_jack/hand.dart';
import 'package:flutter/material.dart';

class HandVisualizer extends StatelessWidget {
  final Hand hand;

  const HandVisualizer({Key? key, required this.hand}) : super(key: key);

  String get cardsAsString {
    var sb = StringBuffer();
    for (var card in hand.cards) {
      sb.write('[${card.toString()}]');
    }
    return sb.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(cardsAsString, style: const TextStyle(fontSize: 20),),
          Text('Total: ${hand.value.toString()}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}
