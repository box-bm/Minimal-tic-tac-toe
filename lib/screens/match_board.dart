import 'package:tik_tak_toe/common.dart';
import 'package:tik_tak_toe/models/board_item.dart';
import 'package:tik_tak_toe/models/match_result.dart';
import 'package:tik_tak_toe/models/player.dart';
import 'package:tik_tak_toe/utils/get_player_winner.dart';
import 'package:tik_tak_toe/widgets/board.dart';

class MatchBoard extends StatelessWidget {
  final List<List<BoardItem>> board;
  final Player? winner;
  final int winnerPlayerNumber;
  final MatchResult matchResult;

  const MatchBoard(
      {super.key,
      required this.board,
      required this.matchResult,
      this.winner,
      required this.winnerPlayerNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              S.of(context).matchResult,
              textAlign: TextAlign.start,
            ),
            Text(
              S.of(context).playerWinner(getPlayerName(
                  context, winnerPlayerNumber, winner?.playerName)),
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.start,
            )
          ],
        )),
        body: SafeArea(
            child: Center(
          child: Board(
            currentPlayer: 1,
            board: board,
            matchResult: matchResult,
            disableResetButton: true,
          ),
        )));
  }
}
