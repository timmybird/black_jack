import 'package:black_jack/dealer_hand.dart';
import 'package:black_jack/debug_info.dart';
import 'package:black_jack/game.dart';
import 'package:black_jack/player_actions_row.dart';
import 'package:black_jack/player_hand.dart';
import 'package:black_jack/player_stats.dart';
import 'package:flutter/material.dart';

import 'winner_display.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Game game = Game();
  int numberOfRoundsPlayed = 0;
  int numberOfRoundsWon = 0;
  int numberOfRoundsLost = 0;
  int numberOfRoundsPushed = 0;
  int numberOfDealerBlackJacks = 0;
  int numberOfPlayerBlackJacks = 0;

  @override
  void initState() {
    super.initState();
    game.table.initUnDealtCards();
    game.initialDeal();
    if (game.player.hand.value == 21) {
      game.player.hand.doStand();
      onPlayerDone();
    }
  }

  void onDealButtonPressed() {
    setState(() {
      game.reset();
    });
    if (game.player.hand.value == 21) {
      game.player.hand.doStand();
      onPlayerDone();
    }
  }

  void onHitButtonPressed() {
    setState(() {
      game.hit(game.player.hand);
    });
    if (game.player.hand.value >= 21) {
      game.player.hand.doStand();
      onPlayerDone();
    }
  }

  Future<void> onStandButtonPressed() async {
    setState(() {
      game.player.hand.doStand();
    });
    onPlayerDone();
  }

  Future<void> onPlayerDone() async {
    if (!game.player.hand.isBust) {
      await dealersTurn();
    }
    Winner winner = decideWinner();
    settleDebt(winner);
  }

  Future<void> dealersTurn() async {
    while (!game.dealer.isDone) {
      await Future.delayed(
        const Duration(seconds: 1),
      );
      setState(() {
        game.hit(game.dealer.hand);
      });
    }
  }

  Winner decideWinner() {
    if (game.dealer.hand.isBetterThan(game.player.hand)) {
      return Winner.dealer;
    }
    if (game.player.hand.isBetterThan(game.dealer.hand)) {
      return Winner.player;
    }
    return Winner.push;
  }


  void settleDebt(Winner winner) {
    numberOfRoundsPlayed ++;
    var player = game.player;
    if (winner == Winner.player) {
      setState(() {
        if (player.hand.isBlackJack) {
          player.credits += (player.bet * 1.5).toInt();
          numberOfPlayerBlackJacks ++;
          numberOfRoundsWon ++;
        } else {
          player.credits += player.bet;
          numberOfRoundsWon ++;
        }
      });
    } else if (winner == Winner.dealer) {
      setState(() {
        player.credits -= player.bet;
        numberOfRoundsLost ++;
        if (game.dealer.hand.isBlackJack) {
          numberOfDealerBlackJacks ++;
        }
      });
    } else {
      setState(() {
        numberOfRoundsPushed ++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AnimatedPile(),
            DealerHand(game: game),
            PlayerHand(game: game),
            WinnerDisplay(winner: decideWinner(), game: game,),
            PlayerActionsRow(
              game: game,
              onDealButtonPressed: onDealButtonPressed,
              onHitButtonPressed: onHitButtonPressed,
              onStandButtonPressed: onStandButtonPressed,
            ),
            PlayerStats(game: game,),
            DebugInfo(numberOfRoundsPlayed: numberOfRoundsPlayed,
              numberOfRoundsWon: numberOfRoundsWon,
              numberOfRoundsLost: numberOfRoundsLost,
              numberOfRoundsPushed: numberOfRoundsPushed,
              numberOfDealerBlackJacks: numberOfDealerBlackJacks,
              numberOfPlayerBlackJacks: numberOfPlayerBlackJacks,),
          ],
        ),
      ),
    );
  }
}

enum Winner { player, dealer, push }
