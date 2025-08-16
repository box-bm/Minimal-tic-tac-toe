import 'package:minimal_tic_tac_toe/common.dart';
import 'package:minimal_tic_tac_toe/models/player.dart';
import 'package:minimal_tic_tac_toe/screens/icon_selection.dart';

class PlayerIconPicker extends StatelessWidget {
  final Player player;
  final int playerNumber;
  static String route = "/settings";

  const PlayerIconPicker(
      {super.key, required this.player, required this.playerNumber});

  void navigate(BuildContext context) {
    Navigator.pushNamed(context, IconSelection.route, arguments: playerNumber);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () => navigate(context),
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
        title: Text(S.of(context).iconOf(player.playerName.isEmpty
            ? S.of(context).player(playerNumber + 1)
            : player.playerName)),
        trailing: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () => navigate(context),
          child: Icon(player.gameIcon.icon, size: 44, color: player.color),
        ));
  }
}
