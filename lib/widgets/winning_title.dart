import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class WinningTitle extends StatelessWidget {
  final String? playerName;
  final Color? color;
  const WinningTitle({super.key, this.playerName, this.color});

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        FadeAnimatedText("Winner!",
            textStyle: Theme.of(context).textTheme.displaySmall,
            textAlign: TextAlign.center),
        FadeAnimatedText(playerName ?? "",
            textAlign: TextAlign.center,
            textStyle: Theme.of(context)
                .textTheme
                .displayLarge
                ?.copyWith(color: color))
      ],
      repeatForever: true,
      pause: const Duration(milliseconds: 300),
    );
  }
}
