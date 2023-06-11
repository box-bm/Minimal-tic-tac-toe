import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_tic_tac_toe/bloc/players/players_bloc.dart';
import 'package:minimal_tic_tac_toe/bloc/tic_tac_toe/tic_tac_toe_bloc.dart';
import 'package:minimal_tic_tac_toe/common.dart';
import 'package:minimal_tic_tac_toe/models/ai.dart';
import 'package:minimal_tic_tac_toe/screens/tic_tac_toe.dart';
import 'package:minimal_tic_tac_toe/utils/use_color_by_backgroud_color.dart';

class GameOptionButtons extends StatelessWidget {
  const GameOptionButtons({super.key});

  onPressOption(BuildContext context, Level level) {
    context.read<TicTacToeBloc>().add(InitSinglePlayerGame(level));
    Navigator.pop(context);
    Navigator.pushNamed(context, TicTacToe.route);
  }

  showFullSizeDialog(BuildContext context) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => Dialog.fullscreen(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Spacer(flex: 2),
                  Text(S.of(context).difficult,
                      style: Theme.of(context).textTheme.titleLarge),
                  Text(S.of(context).selectYourDifficultLabel),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      onPressOption(context, Level.easy);
                    },
                    icon: const Icon(Icons.face_5_outlined),
                    label: Text(S.of(context).easy),
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor:
                            const Color.fromARGB(255, 44, 135, 192)),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      onPressOption(context, Level.medium);
                    },
                    icon: const Icon(Icons.face_outlined),
                    label: Text(S.of(context).medium),
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor:
                            const Color.fromARGB(255, 64, 192, 44)),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      onPressOption(context, Level.hight);
                    },
                    icon: const Icon(Icons.face_retouching_natural),
                    label: Text(S.of(context).hard),
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor:
                            const Color.fromARGB(255, 212, 125, 38)),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      onPressOption(context, Level.extreme);
                    },
                    icon: const Icon(Icons.whatshot_outlined),
                    label: Text(S.of(context).impossible),
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor:
                            const Color.fromARGB(255, 192, 54, 44)),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(S.of(context).cancel),
                  ),
                  const Spacer()
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayersBloc, PlayersState>(builder: (context, state) {
      Color player1Color =
          context.read<PlayersBloc>().state.player1.color.withAlpha(180);
      Color player2Color =
          context.read<PlayersBloc>().state.player2.color.withAlpha(180);
      return Column(
        children: [
          ElevatedButton.icon(
              onPressed: () {
                showFullSizeDialog(context);
              },
              icon: const Icon(Icons.person_outline),
              label: Text(S.of(context).singlePlayer)),
          ElevatedButton.icon(
              onPressed: () {
                context.read<TicTacToeBloc>().add(InitMultiplayerPlayerGame());
                Navigator.pushNamed(context, TicTacToe.route);
              },
              icon: const Icon(Icons.people_alt_outlined),
              label: Text(S.of(context).multiplayer),
              style: ElevatedButton.styleFrom(
                  foregroundColor: useColorByBackgroundColor(player2Color),
                  backgroundColor: player2Color)),
        ],
      );
    });
  }
}
