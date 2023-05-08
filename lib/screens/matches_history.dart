import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tik_tak_toe/bloc/players/players_bloc.dart';
import 'package:tik_tak_toe/bloc/tik_tak_toe/tik_tak_toe_bloc.dart';
import 'package:tik_tak_toe/common.dart';
import 'package:tik_tak_toe/models/player.dart';
import 'package:tik_tak_toe/widgets/match_result_card.dart';

class MatchesHistory extends StatelessWidget {
  static String route = "/matchesHistory";
  const MatchesHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).record),
        actions: [
          IconButton(
              onPressed: () =>
                  context.read<TikTakToeBloc>().add(ClearHistory()),
              icon: const Icon(Icons.cleaning_services))
        ],
      ),
      body: SafeArea(child: BlocBuilder<PlayersBloc, PlayersState>(
        builder: (context, state) {
          var players = [state.player1, state.player2];
          return BlocBuilder<TikTakToeBloc, TikTakToeState>(
            builder: (context, state) {
              var history = state.history.reversed;

              if (history.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.hourglass_empty_rounded,
                        size: 48,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        S.of(context).noRecords,
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    ],
                  ),
                );
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  Player? playerWinner =
                      getPlayerWinner(history, players, index);

                  int playerWinnerNumber =
                      playerWinner == players.elementAt(1) ? 1 : 0;

                  return MatchResultCard(
                      board: history.elementAt(index).board.board,
                      playerWinner: playerWinner,
                      matchResult: history.elementAt(index).matchResult,
                      playerWinnerNumber: playerWinnerNumber,
                      dateTimeMatchFinished: history.elementAt(index).dateTime);
                },
                itemCount: state.history.length,
              );
            },
          );
        },
      )),
    );
  }

  Player? getPlayerWinner(dynamic history, List<Player> players, int index) {
    return history.elementAt(index).playerWinner != null
        ? players.elementAt(history.elementAt(index).playerWinner!)
        : null;
  }
}
