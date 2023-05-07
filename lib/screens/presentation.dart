import 'package:tik_tak_toe/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tik_tak_toe/bloc/tik_tak_toe/tik_tak_toe_bloc.dart';
import 'package:tik_tak_toe/screens/settings.dart';
import 'package:tik_tak_toe/screens/tik_tak_toe.dart';
import 'package:tik_tak_toe/widgets/players_form.dart';

class Presentation extends StatelessWidget {
  static String route = "presentation";

  const Presentation({super.key});

  void play(BuildContext context) {
    context.read<TikTakToeBloc>().add(CreateNewBoard());
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
              const Spacer(
                flex: 2,
              ),
              const PlayersForm(),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () => play(context), child: Text(S.of(context).play)),
              const Spacer(),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Settings.route);
                      },
                      icon: const Icon(Icons.settings)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
                ],
              )
            ],
          )),
    );
  }
}
