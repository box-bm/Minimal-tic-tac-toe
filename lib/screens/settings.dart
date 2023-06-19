import 'package:minimal_tic_tac_toe/bloc/settings/current_theme_cubit.dart';
import 'package:minimal_tic_tac_toe/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_tic_tac_toe/bloc/players/players_bloc.dart';
import 'package:minimal_tic_tac_toe/widgets/buttons/sign_out_button.dart';
import 'package:minimal_tic_tac_toe/widgets/settings/player_setting.dart';
import 'package:minimal_tic_tac_toe/widgets/settings/select_theme.dart';
import 'package:minimal_tic_tac_toe/widgets/settings/sound_setting.dart';

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
                          const SizedBox(height: 10),
                          PlayerSetting(playerNumber: 2, player: state.player2),
                        ],
                      );
                    },
                  ),
                  const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Divider()),
                  const SelectTheme(),
                  const SoundSetting(),
                  const SizedBox(height: 20),
                  const SignOutButton(),
                  TextButton.icon(
                      onPressed: () {
                        context.read<PlayersBloc>().add(ResetChanges());
                        context
                            .read<ThemeCubit>()
                            .changeTheme(ThemeMode.system);
                      },
                      icon: const Icon(Icons.restore_rounded),
                      label: Text(S.of(context).resetSettings))
                ],
              ))),
    );
  }
}
