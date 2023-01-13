import 'package:black_jack/game.dart';
import 'package:flutter/material.dart';

class PlayerStats extends StatelessWidget {
  final Game game;
  const PlayerStats({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Credits: ${game.player.credits}'),
      ),

    ],);
  }
}
