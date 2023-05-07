import 'package:tik_tak_toe/common.dart';
import 'package:tik_tak_toe/models/player.dart';

class PlayerBoardHeader extends StatelessWidget {
  final Player player;
  final bool inverted;
  final Player? winner;
  final bool active;
  final bool tie;

  const PlayerBoardHeader({
    super.key,
    required this.player,
    this.inverted = false,
    this.active = false,
    this.tie = false,
    this.winner,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: getElevation(),
        color: getColor(),
        child: Container(
          padding: const EdgeInsets.all(2),
          width: MediaQuery.of(context).size.width * 0.40,
          child: Row(
            textDirection: inverted ? TextDirection.rtl : null,
            children: [
              Icon(
                player.iconData,
                size: 50,
                color: getLabelColor(),
              ),
              const SizedBox(width: 10),
              Text(
                player.playerName.isEmpty ? S.of(context).player(inverted ? 2 : 1) : player.playerName,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: getLabelColor()),
              )
            ],
          ),
        ));
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
    if (player == winner) return Colors.white;
    if (active && winner == null || tie) return null;
    return null;
  }
}
