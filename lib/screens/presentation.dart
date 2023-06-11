import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_tic_tac_toe/bloc/players/players_bloc.dart';
import 'package:minimal_tic_tac_toe/bloc/tic_tac_toe/tic_tac_toe_bloc.dart';
import 'package:minimal_tic_tac_toe/common.dart';
import 'package:minimal_tic_tac_toe/models/ai.dart';
import 'package:minimal_tic_tac_toe/screens/tic_tac_toe.dart';
import 'package:minimal_tic_tac_toe/screens/two_players.dart';
import 'package:minimal_tic_tac_toe/utils/use_color_by_backgroud_color.dart';
import 'package:minimal_tic_tac_toe/widgets/add_banner.dart';
import 'package:minimal_tic_tac_toe/widgets/logo.dart';
import 'package:minimal_tic_tac_toe/widgets/settings_button.dart';
import 'package:minimal_tic_tac_toe/widgets/share_button.dart';

const colorizeColors = [
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];

const colorizeTextStyle = TextStyle(
  fontSize: 50.0,
  fontFamily: 'Horizon',
);

class Presentation extends StatelessWidget {
  static String route = "presentation";

  const Presentation({super.key});

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
                  const Text('Selecciona un nivel para comenzar'),
                  const SizedBox(height: 15),
                  TextButton(
                    onPressed: () {
                      onPressOption(context, Level.easy);
                    },
                    child: Text('Easy'),
                  ),
                  TextButton(
                    onPressed: () {
                      onPressOption(context, Level.medium);
                    },
                    child: Text('Medium'),
                  ),
                  TextButton(
                    onPressed: () {
                      onPressOption(context, Level.hight);
                    },
                    child: Text('Hard'),
                  ),
                  TextButton(
                    onPressed: () {
                      onPressOption(context, Level.extreme);
                    },
                    child: Text('Extreme'),
                  ),
                  const Divider(),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Exit'),
                  ),
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    Color player1Color =
        context.read<PlayersBloc>().state.player1.color.withAlpha(180);
    Color player2Color =
        context.read<PlayersBloc>().state.player2.color.withAlpha(180);

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
                Text("Minimal",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color:
                            context.read<PlayersBloc>().state.player1.color)),
                Text("Tic tac toe",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color:
                            context.read<PlayersBloc>().state.player2.color)),
                const Spacer(),
                Column(
                  children: [
                    ElevatedButton.icon(
                        onPressed: () {
                          showFullSizeDialog(context);
                        },
                        icon: const Icon(Icons.person_outline),
                        label: Text(S.of(context).singlePlayer),
                        style: ElevatedButton.styleFrom(
                          foregroundColor:
                              useColorByBackgroundColor(player1Color),
                        )),
                    ElevatedButton.icon(
                        onPressed: () {
                          context
                              .read<TicTacToeBloc>()
                              .add(InitMultiplayerPlayerGame());

                          Navigator.pushNamed(context, TwoPlayers.route);
                        },
                        icon: const Icon(Icons.people_alt_outlined),
                        label: Text(S.of(context).multiplayer),
                        style: ElevatedButton.styleFrom(
                          foregroundColor:
                              useColorByBackgroundColor(player2Color),
                          backgroundColor: player2Color,
                        )),
                  ],
                ),
                const Spacer(),
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
