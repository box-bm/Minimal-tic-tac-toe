import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tik_tak_toe/bloc/tik_tak_toe/tik_tak_toe_bloc.dart';
import 'package:tik_tak_toe/screens/settings.dart';
import 'package:tik_tak_toe/widgets/board.dart';
import 'package:tik_tak_toe/widgets/board_title.dart';
import 'package:tik_tak_toe/widgets/winning_title.dart';

class TikTakToe extends StatefulWidget {
  static String route = "/tikTakToe";
  const TikTakToe({super.key});

  @override
  State<TikTakToe> createState() => _TikTakToeState();
}

class _TikTakToeState extends State<TikTakToe> {
  @override
  void initState() {
    super.initState();
    context.read<TikTakToeBloc>().add(const InitBoard());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [
          IconButton(
              onPressed: () => context.read<TikTakToeBloc>().add(ResetBoard()),
              icon: const Icon(Icons.replay_outlined)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Settings.route);
              },
              icon: const Icon(Icons.settings)),
        ]),
        body: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: BoardTitle(),
                ),
                Expanded(
                  flex: 3,
                  child: Board(),
                )
              ],
            )));
  }
}
