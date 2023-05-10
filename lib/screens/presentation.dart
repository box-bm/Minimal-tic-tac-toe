import 'package:tik_tak_toe/bloc/players/players_bloc.dart';
import 'package:tik_tak_toe/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tik_tak_toe/bloc/tik_tak_toe/tik_tak_toe_bloc.dart';
import 'package:tik_tak_toe/screens/tik_tak_toe.dart';
import 'package:tik_tak_toe/widgets/add_banner.dart';
import 'package:tik_tak_toe/widgets/logo.dart';
import 'package:tik_tak_toe/widgets/player_input.dart';
import 'package:tik_tak_toe/widgets/settings_button.dart';

class Presentation extends StatelessWidget {
  static String route = "presentation";

  const Presentation({super.key});

  void play(BuildContext context) {
    context.read<TikTakToeBloc>().add(CreateNewBoard());
    Navigator.pushNamed(context, TikTakToe.route);
  }

  void playNewMatches(BuildContext context) {
    context.read<TikTakToeBloc>().add(ClearHistory());
    Navigator.pushNamed(context, TikTakToe.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              BlocBuilder<TikTakToeBloc, TikTakToeState>(
                  builder: (context, state) => Visibility(
                      visible: state.history.isNotEmpty,
                      child: TextButton(
                          onPressed: () => playNewMatches(context),
                          child: Text(S.of(context).newGame)))),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [SettingsButton()],
              ),
              const Spacer(),
              const AddBanner(),
            ],
          )),
    );
  }
}
