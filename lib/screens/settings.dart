import 'package:tik_tak_toe/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tik_tak_toe/bloc/players/players_bloc.dart';
import 'package:tik_tak_toe/widgets/players_form.dart';

class Settings extends StatelessWidget {
  static String route = "/settings";
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(S.of(context).settings)),
        body: SafeArea(
            minimum: const EdgeInsets.only(left: 10, right: 10, top: 12),
            child: Column(
              children: [
                const PlayersForm(
                  hideColorPicker: false,
                ),
                const Spacer(),
                TextButton.icon(
                    onPressed: () {
                      context.read<PlayersBloc>().add(ResetChanges());
                    },
                    icon: const Icon(Icons.restore_rounded),
                    label: Text(S.of(context).resetSettings))
              ],
            )));
  }
}
