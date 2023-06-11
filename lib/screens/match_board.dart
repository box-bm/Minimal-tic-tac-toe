import 'package:lit_relative_date_time/lit_relative_date_time.dart';
import 'package:minimal_tic_tac_toe/common.dart';
import 'package:minimal_tic_tac_toe/config/relative_date_localizations_es.dart';
import 'package:minimal_tic_tac_toe/models/board_item.dart';
import 'package:minimal_tic_tac_toe/models/match_result.dart';
import 'package:minimal_tic_tac_toe/models/player.dart';
import 'package:minimal_tic_tac_toe/utils/get_player_winner.dart';
import 'package:minimal_tic_tac_toe/widgets/board.dart';

class MatchBoard extends StatelessWidget {
  final List<List<BoardItem>> board;
  final Player? winner;
  final int winnerPlayerNumber;
  final MatchResult matchResult;
  final DateTime dateTimeMatchFinished;

  const MatchBoard(
      {super.key,
      required this.board,
      required this.matchResult,
      required this.dateTimeMatchFinished,
      this.winner,
      required this.winnerPlayerNumber});

  @override
  Widget build(BuildContext context) {
    RelativeDateFormat relativeDateTime = RelativeDateFormat(
        Localizations.localeOf(context),
        localizations: [...LOC_ALL, relativeDateLocalizationEs]);

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
              matchResult == MatchResult.tie
                  ? S.of(context).tie
                  : S.of(context).playerWinner(getPlayerName(
                      context, winnerPlayerNumber, winner?.playerName)),
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.start,
            )
          ],
        )),
        body: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Column(
              children: [
                Expanded(
                  child: Board(
                    currentPlayer: 1,
                    board: board,
                    matchResult: matchResult,
                    disableResetButton: true,
                  ),
                ),
                Text(relativeDateTime.format(RelativeDateTime(
                    dateTime: DateTime.now(), other: dateTimeMatchFinished)))
              ],
            )));
  }
}
