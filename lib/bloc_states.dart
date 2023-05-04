import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tik_tak_toe/bloc/tik_tak_toe/tik_tak_toe_bloc.dart';
import 'package:tik_tak_toe/models/player.dart';

class BlocAppStates extends StatelessWidget {
  final Widget child;
  const BlocAppStates({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<TikTakToeBloc>(
        create: (context) => TikTakToeBloc(players: const [
          Player(
              playerName: "Player 1",
              color: Color.fromARGB(255, 180, 139, 17),
              iconData: Icons.close),
          Player(
              playerName: "Player 2",
              color: Color.fromARGB(255, 17, 161, 180),
              iconData: Icons.circle_outlined),
        ], playerTurnIndex: 1),
      )
    ], child: child);
  }
}
