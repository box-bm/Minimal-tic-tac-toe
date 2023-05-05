import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tik_tak_toe/bloc/tik_tak_toe/tik_tak_toe_bloc.dart';
import 'package:tik_tak_toe/models/win_options.dart';
import 'package:tik_tak_toe/widgets/tie_title.dart';
import 'package:tik_tak_toe/widgets/winning_title.dart';

class BoardTitle extends StatelessWidget {
  const BoardTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TikTakToeBloc, TikTakToeState>(
      builder: (context, state) {
        return Visibility(
            visible: state is GameWon || state is NoWinner,
            child: Center(
                child: state.winOption == WinOption.tie
                    ? const TieTitle()
                    : WinningTitle(
                        color: state.playerWinner?.color,
                        playerName: state.playerWinner?.playerName,
                      )));
      },
    );
  }
}
