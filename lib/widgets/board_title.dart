import 'package:tik_tak_toe/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tik_tak_toe/bloc/players/players_bloc.dart';
import 'package:tik_tak_toe/models/match_result.dart';
import 'package:tik_tak_toe/widgets/tie_title.dart';
import 'package:tik_tak_toe/widgets/winning_title.dart';

class BoardTitle extends StatelessWidget {
  final int? playerWinner;
  final MatchResult result;
  final bool visible;
  const BoardTitle(
      {super.key,
      this.playerWinner,
      required this.result,
      required this.visible});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayersBloc, PlayersState>(
      builder: (context, state) {
        var players = [state.player1, state.player2];

        return Visibility(
            visible: visible,
            child: Center(
                child: result == MatchResult.tie
                    ? const TieTitle()
                    : WinningTitle(
                  playerNumber: playerWinner,
                        color: playerWinner != null
                            ? players.elementAt(playerWinner!).color
                            : null,
                        playerName: playerWinner != null
                            ? players.elementAt(playerWinner!).playerName
                            : null,
                      )));
      },
    );
  }
}
