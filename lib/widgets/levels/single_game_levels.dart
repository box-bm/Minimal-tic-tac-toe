import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_tic_tac_toe/bloc/tic_tac_toe/tic_tac_toe_bloc.dart';
import 'package:minimal_tic_tac_toe/common.dart';
import 'package:minimal_tic_tac_toe/models/levels.dart';
import 'package:minimal_tic_tac_toe/screens/tic_tac_toe.dart';
import 'package:minimal_tic_tac_toe/widgets/levels/game_level_button.dart';

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
        const Spacer(flex: 3),
        Text(S.of(context).difficult,
            style: Theme.of(context).textTheme.titleLarge),
        Text(S.of(context).selectYourDifficultLabel),
        const SizedBox(height: 20),
        SizedBox(
          width: 200,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: Level.values
                  .map(
                    (e) => GameLevelButton(
                        onPressed: () => onPressOption(context, e),
                        icon: e.icon.icon,
                        label: e.label,
                        background: e.color),
                  )
                  .toList()),
        ),
        const Spacer(),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(S.of(context).cancel),
        ),
        const Spacer(
          flex: 2,
        )
      ],
    );
  }
}
