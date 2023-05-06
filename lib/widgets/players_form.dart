import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tik_tak_toe/bloc/players/players_bloc.dart';

class PlayersForm extends StatefulWidget {
  const PlayersForm({super.key});

  @override
  State<PlayersForm> createState() => _PlayersFormState();
}

class _PlayersFormState extends State<PlayersForm> {
  TextEditingController player1Input = TextEditingController();
  TextEditingController player2Input = TextEditingController();

  @override
  void initState() {
    player1Input.text =
        context.read<PlayersBloc>().state.player1.playerName ?? "";
    player2Input.text =
        context.read<PlayersBloc>().state.player2.playerName ?? "";
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
        builder: (context, state) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: player1Input,
                  onChanged: (value) => changeValue(1, value),
                  decoration: InputDecoration(
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
                                      .color ??
                                  const Color(0xFF000000))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: context
                                      .read<PlayersBloc>()
                                      .state
                                      .player1
                                      .color ??
                                  const Color(0xFF000000))),
                      labelStyle: TextStyle(
                          color:
                              context.read<PlayersBloc>().state.player1.color),
                      labelText: "Player 1",
                      hintText: "Player 1"),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: player2Input,
                  onChanged: (value) => changeValue(2, value),
                  decoration: InputDecoration(
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
                                      .color ??
                                  const Color(0xFF000000))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: context
                                      .read<PlayersBloc>()
                                      .state
                                      .player2
                                      .color ??
                                  const Color(0xFF000000))),
                      labelStyle: TextStyle(
                          color:
                              context.read<PlayersBloc>().state.player2.color),
                      labelText: "Player 2",
                      hintText: "Player 2"),
                ),
              ],
            ));
  }
}