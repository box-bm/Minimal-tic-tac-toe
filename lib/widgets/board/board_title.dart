import 'package:minimal_tic_tac_toe/common.dart';
import 'package:minimal_tic_tac_toe/models/match_result.dart';
import 'package:minimal_tic_tac_toe/models/player.dart';
import 'package:minimal_tic_tac_toe/widgets/board/tie_title.dart';
import 'package:minimal_tic_tac_toe/widgets/board/winning_title.dart';

class BoardTitle extends StatelessWidget {
  final List<Player> players;
  final int? playerWinner;
  final MatchResult result;
  final bool visible;

  const BoardTitle({
    super.key,
    this.playerWinner,
    required this.result,
    required this.visible,
    required this.players,
  });

  @override
  Widget build(BuildContext context) {
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
  }
}
