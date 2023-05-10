import 'package:minimal_tic_tac_toe/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_tic_tac_toe/bloc/players/players_bloc.dart';
import 'package:minimal_tic_tac_toe/widgets/player_setting.dart';

class Settings extends StatelessWidget {
  static String route = "/settings";

  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).settings)),
      body: SingleChildScrollView(
          child: SafeArea(
              minimum: const EdgeInsets.only(left: 10, right: 10, top: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BlocBuilder<PlayersBloc, PlayersState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          PlayerSetting(playerNumber: 1, player: state.player1),
                          const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Divider()),
                          PlayerSetting(playerNumber: 2, player: state.player2),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  TextButton.icon(
                      onPressed: () {
                        context.read<PlayersBloc>().add(ResetChanges());
                      },
                      icon: const Icon(Icons.restore_rounded),
                      label: Text(S.of(context).resetSettings))
                ],
              ))),
    );
  }
}
