import 'package:minimal_tic_tac_toe/common.dart';
import 'package:minimal_tic_tac_toe/models/board_match_history_item.dart';
import 'package:minimal_tic_tac_toe/models/match_result.dart';
import 'package:minimal_tic_tac_toe/models/player.dart';
import 'package:minimal_tic_tac_toe/widgets/board/player_board_header.dart';

class BoardTurn extends StatelessWidget {
  final List<Player> players;
  final MatchResult result;
  final bool singlePlayer;
  final int? winner;
  final int currentPlayer;
  final List<BoardMatchHistoryItem> history;

  const BoardTurn(
      {super.key,
      required this.players,
      required this.history,
      required this.result,
      required this.currentPlayer,
      this.winner,
      required this.singlePlayer});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: players
          .map((e) => PlayerBoardHeader(
              player: e,
              playerNumber: players.elementAt(1) == e ? 2 : 1,
              winnerTimes: history
                  .where((element) =>
                      element.playerWinner ==
                          (players.elementAt(1) == e ? 1 : 0) &&
                      element.playerWinner != null)
                  .length,
              inverted: players.elementAt(1) == e,
              active:
                  singlePlayer ? false : players.elementAt(currentPlayer) == e,
              winner: winner != null ? players.elementAt(winner!) : null,
              tie: result == MatchResult.tie))
          .toList(),
    );
  }
}
