import 'package:flutter/material.dart';
import 'package:tik_tak_toe/models/option.dart';
import 'package:tik_tak_toe/utils/create_by_dimensions.dart';
import 'package:tik_tak_toe/widgets/board.dart';
import 'package:tik_tak_toe/widgets/winning_title.dart';

class TikTakToeApp extends StatefulWidget {
  const TikTakToeApp({super.key});

  @override
  State<TikTakToeApp> createState() => _TikTakToeAppState();
}

class _TikTakToeAppState extends State<TikTakToeApp> {
  List<List<Option>> options = createBoardByDimensions(3);
  int player = 1;

  void changePlayer() {
    setState(() {
      player = player == 1 ? 2 : 1;
    });
  }

  void choiseOption(int x, int y) {
    var newOptions = options;
    newOptions[x][y].select(player);
    setState(() {
      options = newOptions;
    });
    changePlayer();
  }

  void reset() {
    setState(() {
      options = createBoardByDimensions(3);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(
          appBar: AppBar(actions: [
            IconButton(
                onPressed: reset, icon: const Icon(Icons.replay_outlined)),
            IconButton(onPressed: reset, icon: const Icon(Icons.settings)),
          ]),
          body: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WinningTitle(),
              Expanded(
                child: Board(
                    options: options,
                    playerNumber: player,
                    onTapCard: choiseOption),
              )
            ],
          ))),
    );
  }
}
