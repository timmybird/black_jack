import 'package:black_jack/game.dart';
import 'package:black_jack/stand_button.dart';
import 'package:flutter/material.dart';

import 'deal_button.dart';
import 'hit_button.dart';

class PlayerActionsRow extends StatelessWidget {
  final Game game;
  final VoidCallback onDealButtonPressed;
  final VoidCallback onHitButtonPressed;
  final VoidCallback onStandButtonPressed;

  const PlayerActionsRow({
    Key? key,
    required this.game,
    required this.onDealButtonPressed,
    required this.onHitButtonPressed,
    required this.onStandButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          if (game.isOver)
            DealButton(
              game: game,
              onPressed: onDealButtonPressed,
            ),
          if (!game.isOver && !game.player.hand.isDone)
            Row(
            children: [
              HitButton(
                game: game,
                onPressed: onHitButtonPressed,
              ),
              StandButton(
                game: game,
                onPressed: onStandButtonPressed,
              ),
            ],
          )
        ],
      ),
    );
  }
}
