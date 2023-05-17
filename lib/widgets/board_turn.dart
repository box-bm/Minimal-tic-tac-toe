import 'package:minimal_tic_tac_toe/bloc/tic_tac_toe/tic_tac_toe_bloc.dart';
import 'package:minimal_tic_tac_toe/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_tic_tac_toe/bloc/players/players_bloc.dart';
import 'package:minimal_tic_tac_toe/widgets/player_board_header.dart';

class BoardTurn extends StatelessWidget {
  final int currentPlayer;
  final bool tie;
  final int? winner;
  const BoardTurn(
      {super.key, required this.currentPlayer, this.tie = false, this.winner});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayersBloc, PlayersState>(
      builder: (context, state) {
        var players = [state.player1, state.player2];
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
                      active: players.elementAt(currentPlayer) == e,
                      winner:
                          winner != null ? players.elementAt(winner!) : null,
                      tie: tie))
                  .toList(),
            );
          },
        );
      },
    );
  }
}
