import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class TieTitle extends StatelessWidget {
  const TieTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        RotateAnimatedText("Tie",
            textAlign: TextAlign.center,
            textStyle: Theme.of(context).textTheme.displayMedium),
        RotateAnimatedText("Anyone's won",
            textAlign: TextAlign.center,
            textStyle: Theme.of(context).textTheme.displayMedium)
      ],
      repeatForever: true,
      pause: const Duration(milliseconds: 300),
    );
  }
}
