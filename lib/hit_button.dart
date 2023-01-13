import 'package:black_jack/game.dart';
import 'package:flutter/material.dart';

class HitButton extends StatelessWidget {
  final Game game;
  final VoidCallback onPressed;
  const HitButton({Key? key, required this.game, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: const Text('Hit'));
  }
}
