import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_tic_tac_toe/bloc/players/players_bloc.dart';
import 'package:minimal_tic_tac_toe/common.dart';
import 'package:minimal_tic_tac_toe/models/player.dart';
import 'package:minimal_tic_tac_toe/screens/icon_selection.dart';

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
    return BlocListener<PlayersBloc, PlayersState>(
        listener: (context, state) {
          if (state.players[widget.playerNumber].playerName !=
              playerInputController.text) {
            playerInputController.text =
                state.players[widget.playerNumber].playerName;
            playerInputController.selection = TextSelection.collapsed(
                offset: state.players[widget.playerNumber].playerName.length);
          }
        },
        child: Semantics(
            textField: true,
            label: "Player ${widget.playerNumber + 1} name's input",
            child: TextField(
              autofocus: false,
              controller: playerInputController,
              onChanged: (value) => changeValue(value),
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, IconSelection.route,
                            arguments: widget.playerNumber);
                      },
                      icon: Semantics(
                        label: "Change player ${widget.playerNumber + 1} icon",
                        button: true,
                        child: Icon(widget.player.gameIcon.icon),
                      )),
                  prefixIconColor: widget.player.color,
                  suffixIcon: Visibility(
                      visible: playerInputController.text.isNotEmpty,
                      child: Semantics(
                        label:
                            "Clear player ${widget.playerNumber + 1} name input",
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: clear,
                            icon: const Icon(Icons.close)),
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: widget.player.color)),
                  labelStyle: TextStyle(color: widget.player.color),
                  labelText: S.of(context).player(widget.playerNumber + 1),
                  hintText: S.of(context).player(widget.playerNumber)),
            )));
  }
}
