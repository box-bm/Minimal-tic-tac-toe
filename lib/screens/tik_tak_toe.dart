import 'package:tik_tak_toe/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tik_tak_toe/bloc/tik_tak_toe/tik_tak_toe_bloc.dart';
import 'package:tik_tak_toe/models/match_result.dart';
import 'package:tik_tak_toe/screens/matches_history.dart';
import 'package:tik_tak_toe/screens/settings.dart';
import 'package:tik_tak_toe/widgets/board.dart';
import 'package:tik_tak_toe/widgets/board_title.dart';
import 'package:tik_tak_toe/widgets/board_turn.dart';

class TikTakToe extends StatefulWidget {
  static String route = "/tikTakToe";
  const TikTakToe({super.key});

  @override
  State<TikTakToe> createState() => _TikTakToeState();
}

class _TikTakToeState extends State<TikTakToe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [
          IconButton(
              onPressed: () => context.read<TikTakToeBloc>().add(ResetBoard()),
              icon: const Icon(Icons.replay_outlined)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, MatchesHistory.route);
              },
              icon: const Icon(Icons.assignment_outlined)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Settings.route);
              },
              icon: const Icon(Icons.settings)),
        ]),
        body: BlocBuilder<TikTakToeBloc, TikTakToeState>(
          buildWhen: (previous, current) {
            return true;
          },
          builder: (context, state) {
            return SafeArea(
                minimum: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BoardTurn(
                        currentPlayer: state.currentPlayer,
                        winner: state.playerWinner,
                        tie: state.board.matchResult == MatchResult.tie),
                    Expanded(
                      flex: 1,
                      child: BoardTitle(
                          playerWinner: state.playerWinner,
                          result: state.board.matchResult,
                          visible: state is GameEnded),
                    ),
                    Expanded(
                      flex: 5,
                      child: Board(
                        board: state.board.board,
                        currentPlayer: state.currentPlayer,
                        matchResult: state.board.matchResult,
                      ),
                    )
                  ],
                ));
          },
        ));
  }
}
