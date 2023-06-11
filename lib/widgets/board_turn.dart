import 'package:minimal_tic_tac_toe/bloc/tic_tac_toe/tic_tac_toe_bloc.dart';
import 'package:minimal_tic_tac_toe/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_tic_tac_toe/bloc/players/players_bloc.dart';
import 'package:minimal_tic_tac_toe/models/ai.dart';
import 'package:minimal_tic_tac_toe/models/match_result.dart';
import 'package:minimal_tic_tac_toe/widgets/player_board_header.dart';

class BoardTurn extends StatelessWidget {
  final int currentPlayer;
  final MatchResult result;
  final bool singlePlayer;
  final int? winner;
  const BoardTurn(
      {super.key,
      required this.currentPlayer,
      required this.result,
      this.winner,
      required this.singlePlayer});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayersBloc, PlayersState>(
      builder: (context, state) {
        var players = [
          state.player1,
          singlePlayer ? AI().player(color: state.player2.color) : state.player2
        ];
        return BlocBuilder<TicTacToeBloc, TicTacToeState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: players
                  .map((e) => PlayerBoardHeader(
                      player: e,
                      playerNumber: players.elementAt(1) == e ? 2 : 1,
                      winnerTimes: state.history
                          .where((element) =>
                              element.playerWinner ==
                                  (players.elementAt(1) == e ? 1 : 0) &&
                              element.playerWinner != null)
                          .length,
                      inverted: players.elementAt(1) == e,
                      active: singlePlayer
                          ? false
                          : players.elementAt(currentPlayer) == e,
                      winner:
                          winner != null ? players.elementAt(winner!) : null,
                      tie: result == MatchResult.tie))
                  .toList(),
            );
          },
        );
      },
    );
  }
}
