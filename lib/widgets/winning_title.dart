import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tik_tak_toe/bloc/tik_tak_toe/tik_tak_toe_bloc.dart';

class WinningTitle extends StatelessWidget {
  const WinningTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TikTakToeBloc, TikTakToeState>(
      builder: (context, state) {
        return Visibility(
            visible: state is GameWon,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Winner!",
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: TextAlign.center,
                ),
                Text(
                  state.playerWinner?.playerName ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(color: state.playerWinner?.color),
                  textAlign: TextAlign.center,
                ),
              ],
            ));
      },
    );
  }
}
