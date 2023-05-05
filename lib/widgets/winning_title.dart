import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tik_tak_toe/bloc/tik_tak_toe/tik_tak_toe_bloc.dart';
import 'package:tik_tak_toe/models/win_options.dart';

class WinningTitle extends StatelessWidget {
  const WinningTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TikTakToeBloc, TikTakToeState>(
      builder: (context, state) {
        return Visibility(
            visible: state is GameWon || state is NoWinner,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: state.winOption == WinOption.tie
                  ? [
                      AnimatedTextKit(
                        animatedTexts: [
                          RotateAnimatedText("Tie",
                              textAlign: TextAlign.center,
                              textStyle:
                                  Theme.of(context).textTheme.displayMedium),
                          RotateAnimatedText("Anyone's won",
                              textAlign: TextAlign.center,
                              textStyle:
                                  Theme.of(context).textTheme.displayMedium)
                        ],
                        repeatForever: true,
                        pause: const Duration(milliseconds: 300),
                      )
                    ]
                  : [
                      AnimatedTextKit(
                        animatedTexts: [
                          FadeAnimatedText("Winner!",
                              textStyle:
                                  Theme.of(context).textTheme.displaySmall,
                              textAlign: TextAlign.center),
                          FadeAnimatedText(state.playerWinner?.playerName ?? "",
                              textAlign: TextAlign.center,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .displayLarge
                                  ?.copyWith(color: state.playerWinner?.color))
                        ],
                        repeatForever: true,
                        pause: const Duration(milliseconds: 300),
                      ),
                    ],
            ));
      },
    );
  }
}
