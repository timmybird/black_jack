import 'package:black_jack/game.dart';
import 'package:flutter/material.dart';

class DealButton extends StatelessWidget {
  final Game game;
  final VoidCallback onPressed;
  const DealButton({Key? key, required this.game, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: const Text('Deal'));
  }
}
