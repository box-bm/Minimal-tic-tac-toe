import 'package:lit_relative_date_time/lit_relative_date_time.dart';
import 'package:minimal_tic_tac_toe/common.dart';
import 'package:minimal_tic_tac_toe/config/relative_date_localizations_es.dart';
import 'package:minimal_tic_tac_toe/models/board_item.dart';
import 'package:minimal_tic_tac_toe/models/match_result.dart';
import 'package:minimal_tic_tac_toe/models/player.dart';
import 'package:minimal_tic_tac_toe/screens/match_board.dart';
import 'package:minimal_tic_tac_toe/utils/use_color_by_backgroud_color.dart';

class MatchResultCard extends StatelessWidget {
  final Player? playerWinner;
  final List<Player> players;
  final List<List<BoardItem>> board;
  final MatchResult matchResult;
  final int playerWinnerNumber;
  final DateTime dateTimeMatchFinished;

  const MatchResultCard(
      {super.key,
      this.playerWinner,
      required this.players,
      required this.matchResult,
      required this.playerWinnerNumber,
      required this.dateTimeMatchFinished,
      required this.board});

  @override
  Widget build(BuildContext context) {
    Color? contentColor = getContentColor();

    RelativeDateFormat relativeDateTime = RelativeDateFormat(
        Localizations.localeOf(context),
        localizations: [...LOC_ALL, relativeDateLocalizationEs]);

    bool tie = matchResult == MatchResult.tie;

    return Card(
        color: getColor(matchResult: matchResult, playerWinnner: playerWinner),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MatchBoard(
                        players: players,
                        board: board,
                        matchResult: matchResult,
                        winner: playerWinner,
                        winnerPlayerNumber: playerWinnerNumber,
                        dateTimeMatchFinished: dateTimeMatchFinished,
                      ))),
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
              child: Row(
                children: [
                  Icon(
                    tie ? Icons.tag_outlined : playerWinner?.iconData,
                    size: 45,
                    color: contentColor,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                        Visibility(
                            visible: !tie,
                            child: Text(
                              S.of(context).winner,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: contentColor, height: 1),
                            )),
                        Text(
                          tie ? S.of(context).tie : getName(context),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  color: contentColor,
                                  height: 1.3,
                                  fontWeight: tie ? null : FontWeight.bold),
                        ),
                        Text(
                            relativeDateTime.format(RelativeDateTime(
                                dateTime: DateTime.now(),
                                other: dateTimeMatchFinished)),
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: contentColor, height: 0))
                      ])),
                  Icon(
                    Icons.chevron_right,
                    color: getContentColor(),
                  )
                ],
              )),
        ));
  }

  Color? getColor({Player? playerWinnner, required MatchResult matchResult}) {
    if (playerWinnner != null) return playerWinnner.color;
    return null;
  }

  Color? getContentColor() {
    if (playerWinner != null) {
      return useColorByBackgroundColor(playerWinner!.color);
    }
    return null;
  }

  String getName(BuildContext context) {
    return (playerWinner?.playerName ?? "").isEmpty
        ? S.of(context).player(playerWinnerNumber + 1)
        : playerWinner!.playerName;
  }
}
