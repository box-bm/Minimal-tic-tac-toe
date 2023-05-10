import 'package:minimal_tic_tac_toe/common.dart';
import 'package:minimal_tic_tac_toe/models/player.dart';
import 'package:minimal_tic_tac_toe/utils/use_color_by_backgroud_color.dart';

class BoardButton extends StatelessWidget {
  final bool disabled;
  final Player? player;
  final bool winner;
  final bool tie;
  final void Function() tapButton;

  const BoardButton(
      {super.key,
      required this.tapButton,
      this.winner = false,
      this.disabled = false,
      this.tie = false,
      this.player});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        elevation: getElevation(),
        color: getColor(),
        child: InkWell(
          onTap: player != null || disabled ? null : tapButton,
          borderRadius: BorderRadius.circular(10),
          child: FittedBox(
              fit: BoxFit.fill,
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Icon(player?.iconData, color: getIconColor()),
              )),
        ),
      ),
    );
  }

  double? getElevation() {
    if (winner) return 10;
    if (tie || player != null) return 0;
    return null;
  }

  Color? getColor() {
    if (tie) return player?.color.withAlpha(10);
    if (winner) return player?.color;
    if (player != null) return player?.color.withOpacity(0.2);
    return null;
  }

  Color? getIconColor() {
    if (tie) return player?.color.withAlpha(40);
    if (winner) {
      return useColorByBackgroundColor(player?.color ?? Colors.black);
    }
    if (player != null) return player?.color;
    return null;
  }
}
