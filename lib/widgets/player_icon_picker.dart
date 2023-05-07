import 'package:tik_tak_toe/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:tik_tak_toe/bloc/players/players_bloc.dart';
import 'package:tik_tak_toe/models/player.dart';
import 'package:tik_tak_toe/screens/icon_selection.dart';

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
            ? S.of(context).player(playerNumber)
            : player.playerName)),
        trailing: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () => navigate(context),
          child: Icon(player.iconData, size: 44),
        ));
  }
}
