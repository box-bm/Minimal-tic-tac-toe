import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_tic_tac_toe/bloc/tic_tac_toe/tic_tac_toe_bloc.dart';
import 'package:minimal_tic_tac_toe/common.dart';
import 'package:minimal_tic_tac_toe/models/ai.dart';
import 'package:minimal_tic_tac_toe/screens/tic_tac_toe.dart';

class SingleGameLevels extends StatelessWidget {
  const SingleGameLevels({super.key});

  onPressOption(BuildContext context, Level level) {
    context.read<TicTacToeBloc>().add(InitSinglePlayerGame(level));
    Navigator.pop(context);
    Navigator.pushNamed(context, TicTacToe.route);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
              backgroundColor: const Color.fromARGB(255, 44, 135, 192)),
        ),
        ElevatedButton.icon(
          onPressed: () {
            onPressOption(context, Level.medium);
          },
          icon: const Icon(Icons.face_outlined),
          label: Text(S.of(context).medium),
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 64, 192, 44)),
        ),
        ElevatedButton.icon(
          onPressed: () {
            onPressOption(context, Level.hight);
          },
          icon: const Icon(Icons.face_retouching_natural),
          label: Text(S.of(context).hard),
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 212, 125, 38)),
        ),
        ElevatedButton.icon(
          onPressed: () {
            onPressOption(context, Level.extreme);
          },
          icon: const Icon(Icons.whatshot_outlined),
          label: Text(S.of(context).impossible),
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 192, 54, 44)),
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
    );
  }
}
