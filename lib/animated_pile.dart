import 'package:flutter/material.dart';

class AnimatedPile extends StatefulWidget {
  const AnimatedPile({Key? key}) : super(key: key);

  @override
  State<AnimatedPile> createState() => _AnimatedPileState();
}

class _AnimatedPileState extends State<AnimatedPile> {
  final double cardWidth = 60;


  double left = 0;
  double right = 0;

  void doStuff() {
    setState(() {
      if (left == 120) {
        left = cardWidth / 2;
      } else {
        left = 120;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.lightBlueAccent)),
          width: double.infinity,
          height: 140,
          child: Stack(
            alignment: AlignmentDirectional.center,
            fit: StackFit.expand,
            children: [
              AnimatedPositioned(
                  curve: Curves.easeOutSine,
                  left: left,
                  right: right,
                  duration: const Duration(milliseconds: 500),
                  child: CardPlaceHolder(
                    width: cardWidth,
                  ))
            ],
          ),
        ),
        TextButton(onPressed: doStuff, child: const Text('Do!'))
      ],
    );
  }
}

class CardPlaceHolder extends StatelessWidget {
  const CardPlaceHolder({Key? key, required this.width}) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width * 1.6,
      decoration: BoxDecoration(border: Border.all(color: Colors.red)),
    );
  }
}
