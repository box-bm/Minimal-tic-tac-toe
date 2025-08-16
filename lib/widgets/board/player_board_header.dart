import 'package:minimal_tic_tac_toe/common.dart';
import 'package:minimal_tic_tac_toe/models/player.dart';
import 'package:minimal_tic_tac_toe/utils/use_color_by_backgroud_color.dart';

class PlayerBoardHeader extends StatelessWidget {
  final Player player;
  final int winnerTimes;
  final bool inverted;
  final Player? winner;
  final bool active;
  final bool tie;
  final int playerNumber;

  const PlayerBoardHeader(
      {super.key,
      required this.player,
      required this.winnerTimes,
      this.inverted = false,
      this.active = false,
      this.tie = false,
      this.winner,
      required this.playerNumber});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: getElevation(),
      color: getColor(),
      child: Semantics(
          label:
              "Player ${player.playerName.isEmpty ? playerNumber : player.playerName} won $winnerTimes times",
          container: true,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
            constraints: const BoxConstraints(
              maxHeight: 65,
            ),
            width: MediaQuery.of(context).size.width * 0.45,
            child: Row(
              textDirection: inverted ? TextDirection.rtl : null,
              children: [
                Icon(
                  player.gameIcon.icon,
                  size: 50,
                  color: getLabelColor(),
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: Column(
                        crossAxisAlignment: inverted
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Semantics(
                          excludeSemantics: true,
                          child: Text(
                            winnerTimes.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: getLabelColor()),
                          )),
                      Semantics(
                        excludeSemantics: true,
                        child: Text(
                          player.playerName.isEmpty
                              ? S.of(context).player(inverted ? 2 : 1)
                              : player.playerName,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: getLabelColor()),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign:
                              inverted ? TextAlign.right : TextAlign.left,
                        ),
                      )
                    ]))
              ],
            ),
          )),
    );
  }

  double? getElevation() {
    if (tie) return null;
    if (player == winner) return 10;
    if (active && winner == null) return 0;
    return 0;
  }

  Color? getColor() {
    if (tie) return player.color.withAlpha(10);
    if (player == winner) return player.color;
    if (active && winner == null) return player.color.withOpacity(0.8);
    return player.color.withAlpha(10);
  }

  Color? getLabelColor() {
    if (player == winner) return useColorByBackgroundColor(player.color);
    if (active && winner == null || tie) {
      return useColorByBackgroundColor(player.color.withOpacity(0.8));
    }
    return null;
  }
}
