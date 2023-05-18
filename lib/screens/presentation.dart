import 'package:minimal_tic_tac_toe/bloc/players/players_bloc.dart';
import 'package:minimal_tic_tac_toe/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_tic_tac_toe/bloc/tic_tac_toe/tic_tac_toe_bloc.dart';
import 'package:minimal_tic_tac_toe/screens/tic_tac_toe.dart';
import 'package:minimal_tic_tac_toe/widgets/add_banner.dart';
import 'package:minimal_tic_tac_toe/widgets/logo.dart';
import 'package:minimal_tic_tac_toe/widgets/player_input.dart';
import 'package:minimal_tic_tac_toe/widgets/settings_button.dart';
import 'package:minimal_tic_tac_toe/widgets/share_button.dart';

class Presentation extends StatelessWidget {
  static String route = "presentation";

  const Presentation({super.key});

  void play(BuildContext context) {
    context.read<TicTacToeBloc>().add(CreateNewBoard());
    Navigator.pushNamed(context, TicTacToe.route);
  }

  void playNewMatches(BuildContext context) {
    context.read<TicTacToeBloc>().add(ClearHistory());
    Navigator.pushNamed(context, TicTacToe.route);
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: "Start page",
      container: true,
      child: Scaffold(
        body: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                const Expanded(flex: 2, child: Logo()),
                const SizedBox(height: 20),
                BlocBuilder<PlayersBloc, PlayersState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        PlayerInput(player: state.player1, playerNumber: 1),
                        const SizedBox(height: 10),
                        PlayerInput(player: state.player2, playerNumber: 2),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () => play(context),
                    child: Text(S.of(context).play)),
                const SizedBox(height: 12),
                BlocBuilder<TicTacToeBloc, TicTacToeState>(
                    builder: (context, state) => Visibility(
                        visible: state.history.isNotEmpty,
                        child: TextButton(
                            onPressed: () => playNewMatches(context),
                            child: Text(S.of(context).newGame)))),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ShareButton(), SettingsButton()],
                ),
                const Spacer(),
                const AddBanner(),
              ],
            )),
      ),
    );
  }
}
