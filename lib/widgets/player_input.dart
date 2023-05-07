import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tik_tak_toe/bloc/players/players_bloc.dart';
import 'package:tik_tak_toe/common.dart';
import 'package:tik_tak_toe/models/player.dart';
import 'package:tik_tak_toe/screens/icon_selection.dart';

class PlayerInput extends StatefulWidget {
  final Player player;
  final int playerNumber;

  const PlayerInput(
      {required this.player, required this.playerNumber, super.key});

  @override
  State<PlayerInput> createState() => _PlayerInputState();
}

class _PlayerInputState extends State<PlayerInput> {
  TextEditingController playerInputController = TextEditingController();

  @override
  void initState() {
    playerInputController.text = widget.player.playerName;
    super.initState();
  }

  void clear() {
    context
        .read<PlayersBloc>()
        .add(ChangePlayerName(playerNumber: widget.playerNumber, name: ""));
    playerInputController.text = "";
  }

  void changeValue(String value) {
    context
        .read<PlayersBloc>()
        .add(ChangePlayerName(playerNumber: widget.playerNumber, name: value));
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: playerInputController,
      onChanged: (value) => changeValue(value),
      decoration: InputDecoration(
          prefixIcon: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, IconSelection.route,
                    arguments: widget.playerNumber);
              },
              icon: Icon(widget.player.iconData)),
          prefixIconColor: widget.player.color,
          suffixIcon: Visibility(
              visible: playerInputController.text.isNotEmpty,
              child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: clear,
                  icon: const Icon(Icons.close))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.player.color)),
          labelStyle: TextStyle(color: widget.player.color),
          labelText: S.of(context).player(widget.playerNumber),
          hintText: S.of(context).player(widget.playerNumber)),
    );
  }
}
