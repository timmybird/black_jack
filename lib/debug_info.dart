import 'package:flutter/material.dart';

class DebugInfo extends StatelessWidget {
  const DebugInfo({
    Key? key,
    required this.numberOfRoundsPlayed,
    required this.numberOfRoundsWon,
    required this.numberOfRoundsLost,
    required this.numberOfRoundsPushed,
    required this.numberOfDealerBlackJacks,
    required this.numberOfPlayerBlackJacks,
  }) : super(key: key);

  final int numberOfRoundsPlayed;
  final int numberOfRoundsWon;
  final int numberOfRoundsLost;
  final int numberOfRoundsPushed;
  final int numberOfDealerBlackJacks;
  final int numberOfPlayerBlackJacks;
  final textStyle = const TextStyle(color: Colors.grey, fontSize: 10);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Debug info:', style: textStyle,),
          Text('Number of rounds played: $numberOfRoundsPlayed', style: textStyle,),
          Text('Number of rounds won: $numberOfRoundsWon', style: textStyle,),
          Text('Number of rounds lost: $numberOfRoundsLost', style: textStyle,),
          Text('Number of rounds pushed: $numberOfRoundsPushed', style: textStyle,),
          Text('Number of player Black Jacks: $numberOfPlayerBlackJacks', style: textStyle,),
          Text('Number of dealer Black Jacks: $numberOfDealerBlackJacks', style: textStyle,),
        ],
      ),
    );
  }
}
