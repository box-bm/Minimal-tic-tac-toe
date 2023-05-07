import 'package:tik_tak_toe/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tik_tak_toe/bloc/players/players_bloc.dart';
import 'package:tik_tak_toe/screens/icon_selection.dart';
import 'package:tik_tak_toe/widgets/player_color_picker.dart';

class PlayersForm extends StatefulWidget {
  final bool hideColorPicker;
  const PlayersForm({super.key, this.hideColorPicker = true});

  @override
  State<PlayersForm> createState() => _PlayersFormState();
}

class _PlayersFormState extends State<PlayersForm> {
  TextEditingController player1Input = TextEditingController();
  TextEditingController player2Input = TextEditingController();

  @override
  void initState() {
    player1Input.text = context.read<PlayersBloc>().state.player1.playerName;
    player2Input.text = context.read<PlayersBloc>().state.player2.playerName;
    super.initState();
  }

  void clear(int playerNumber) {
    context
        .read<PlayersBloc>()
        .add(ChangePlayerName(playerNumber: playerNumber, name: ""));
    if (playerNumber == 1) {
      player1Input.text = "";
    } else {
      player2Input.text = "";
    }
  }

  void changeValue(int playerNumber, String value) {
    context
        .read<PlayersBloc>()
        .add(ChangePlayerName(playerNumber: playerNumber, name: value));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayersBloc, PlayersState>(
        buildWhen: (previous, current) => true,
        builder: (context, state) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: player1Input,
                  onChanged: (value) => changeValue(1, value),
                  decoration: InputDecoration(
                      prefixIcon: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, IconSelection.route,
                                arguments: 1);
                          },
                          icon: Icon(state.player1.iconData)),
                      prefixIconColor:
                          context.read<PlayersBloc>().state.player1.color,
                      suffixIcon: Visibility(
                          visible: player1Input.text.isNotEmpty,
                          child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () => clear(1),
                              icon: const Icon(Icons.close))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: context
                                  .read<PlayersBloc>()
                                  .state
                                  .player1
                                  .color)),
                      labelStyle: TextStyle(
                          color:
                              context.read<PlayersBloc>().state.player1.color),
                      labelText: "Player 1",
                      hintText: "Player 1"),
                ),
                Visibility(
                    visible: !widget.hideColorPicker,
                    child: PlayerColorPicker(
                      player: state.player1,
                      playerNumber: 1,
                    )),
                const SizedBox(height: 12),
                TextField(
                  controller: player2Input,
                  onChanged: (value) => changeValue(2, value),
                  decoration: InputDecoration(
                      prefixIcon: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, IconSelection.route,
                                arguments: 2);
                          },
                          icon: Icon(state.player2.iconData)),
                      prefixIconColor:
                          context.read<PlayersBloc>().state.player2.color,
                      suffixIcon: Visibility(
                          visible: player2Input.text.isNotEmpty,
                          child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () => clear(2),
                              icon: const Icon(Icons.close))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: context
                                  .read<PlayersBloc>()
                                  .state
                                  .player2
                                  .color)),
                      labelStyle: TextStyle(
                          color:
                              context.read<PlayersBloc>().state.player2.color),
                      labelText: "Player 2",
                      hintText: "Player 2"),
                ),
                Visibility(
                    visible: !widget.hideColorPicker,
                    child: PlayerColorPicker(
                      player: state.player2,
                      playerNumber: 2,
                    )),
              ],
            ));
  }
}
