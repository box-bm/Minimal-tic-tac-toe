import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tik_tak_toe/bloc/tik_tak_toe/tik_tak_toe_bloc.dart';
import 'package:tik_tak_toe/models/win_options.dart';
import 'package:tik_tak_toe/widgets/player_board_header.dart';

class BoardTurn extends StatelessWidget {
  const BoardTurn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TikTakToeBloc, TikTakToeState>(
      builder: (context, state) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: state.players
            .map((e) => PlayerBoardHeader(
                  player: e,
                  inverted: state.players.elementAt(1) == e,
                  active: state.players.elementAt(state.playerTurnIndex) == e,
                  tie: state.winOption == WinOption.tie,
                ))
            .toList(),
      ),
    );
  }
}
