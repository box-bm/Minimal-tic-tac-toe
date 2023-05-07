import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tik_tak_toe/bloc/tik_tak_toe/tik_tak_toe_bloc.dart';
import 'package:tik_tak_toe/models/match_result.dart';
import 'package:tik_tak_toe/screens/settings.dart';
import 'package:tik_tak_toe/widgets/board.dart';
import 'package:tik_tak_toe/widgets/board_title.dart';
import 'package:tik_tak_toe/widgets/board_turn.dart';

class TikTakToe extends StatefulWidget {
  static String route = "/tikTakToe";
  const TikTakToe({super.key});

  @override
  State<TikTakToe> createState() => _TikTakToeState();
}

class _TikTakToeState extends State<TikTakToe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [
          IconButton(
              onPressed: () => context.read<TikTakToeBloc>().add(ResetBoard()),
              icon: const Icon(Icons.replay_outlined)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Settings.route);
              },
              icon: const Icon(Icons.settings)),
        ]),
        body: BlocBuilder<TikTakToeBloc, TikTakToeState>(
          buildWhen: (previous, current) {
            return true;
          },
          builder: (context, state) {
            return SafeArea(
                minimum: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BoardTurn(
                        currentPlayer: state.currentPlayer,
                        winner: state.playerWinner,
                        tie: state.matchResult == MatchResult.tie),
                    Expanded(
                      child: BoardTitle(
                          playerWinner: state.playerWinner,
                          result: state.matchResult,
                          visible: state is GameEnded),
                    ),
                    Expanded(
                      flex: 3,
                      child: Board(
                        board: state.board,
                        currentPlayer: state.currentPlayer,
                        matchResult: state.matchResult,
                      ),
                    )
                  ],
                ));
          },
        ));
  }
}
