import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tik_tak_toe/bloc/players/players_bloc.dart';
import 'package:tik_tak_toe/bloc/tik_tak_toe/tik_tak_toe_bloc.dart';
import 'package:tik_tak_toe/screens/settings.dart';
import 'package:tik_tak_toe/screens/tik_tak_toe.dart';

class Presentation extends StatelessWidget {
  static String route = "presentation";

  const Presentation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            onChanged: (value) {
              context.read<PlayersBloc>().add(ChangePlayerName(
                  playerNumber: 1, name: value.isEmpty ? "Player 1" : value));
            },
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color:
                            context.read<PlayersBloc>().state.player1.color ??
                                const Color(0xFF000000))),
                labelStyle: TextStyle(
                    color: context.read<PlayersBloc>().state.player1.color),
                labelText: "Player 1",
                hintText: "Player 1"),
          ),
          TextField(
            onChanged: (value) {
              context.read<PlayersBloc>().add(ChangePlayerName(
                  playerNumber: 2, name: value.isEmpty ? "Player 2" : value));
            },
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color:
                            context.read<PlayersBloc>().state.player2.color ??
                                const Color(0xFF000000))),
                labelStyle: TextStyle(
                    color: context.read<PlayersBloc>().state.player2.color),
                labelText: "Player 2",
                hintText: "Player 2"),
          ),
          ElevatedButton(
              onPressed: () {
                var playersState = context.read<PlayersBloc>().state;
                context.read<TikTakToeBloc>().add(InitBoard(
                    players: [playersState.player1, playersState.player2]));
                Navigator.pushNamed(context, TikTakToe.route);
              },
              child: const Text("Play!")),
          const Spacer(),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Settings.route);
                  },
                  icon: const Icon(Icons.settings)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
            ],
          )
        ],
      )),
    );
  }
}
