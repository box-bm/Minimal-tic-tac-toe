import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_tic_tac_toe/bloc/players/players_bloc.dart';
import 'package:minimal_tic_tac_toe/bloc/tic_tac_toe/tic_tac_toe_bloc.dart';
import 'package:minimal_tic_tac_toe/common.dart';
import 'package:minimal_tic_tac_toe/screens/tic_tac_toe.dart';
import 'package:minimal_tic_tac_toe/utils/use_color_by_backgroud_color.dart';
import 'package:minimal_tic_tac_toe/widgets/levels/single_game_levels.dart';

class GameOptionButtons extends StatelessWidget {
  const GameOptionButtons({super.key});

  showFullSizeDialog(BuildContext context) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) =>
            const Dialog.fullscreen(child: SingleGameLevels()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayersBloc, PlayersState>(builder: (context, state) {
      Color player1Color = state.player1.color.withAlpha(180);
      Color player2Color = state.player2.color.withAlpha(180);

      return Column(
        children: [
          ElevatedButton.icon(
              onPressed: () {
                showFullSizeDialog(context);
              },
              icon: const Icon(Icons.person_outline),
              label: Text(S.of(context).singlePlayer),
              style: ElevatedButton.styleFrom(
                  foregroundColor: useColorByBackgroundColor(player1Color),
                  backgroundColor: player1Color)),
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
