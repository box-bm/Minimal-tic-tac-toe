import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_tic_tac_toe/bloc/tic_tac_toe/tic_tac_toe_bloc.dart';
import 'package:minimal_tic_tac_toe/common.dart';
import 'package:minimal_tic_tac_toe/models/levels.dart';
import 'package:minimal_tic_tac_toe/screens/tic_tac_toe.dart';
import 'package:minimal_tic_tac_toe/widgets/levels/game_level_button.dart';

class SingleGameLevels extends StatelessWidget {
  const SingleGameLevels({super.key});

  void onPressOption(BuildContext context, Level level) {
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
        Text(AppLocalizations.of(context).difficult,
            style: Theme.of(context).textTheme.titleLarge),
        Text(AppLocalizations.of(context).selectYourDifficultLabel),
        const SizedBox(height: 20),
        SizedBox(
          width: 200,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: Level.values
                  .map(
                    (e) => GameLevelButton(
                        onPressed: () => onPressOption(context, e),
                        icon: e.icon,
                        label: e.label,
                        background: e.color),
                  )
                  .toList()),
        ),
        const Spacer(),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(AppLocalizations.of(context).cancel),
        ),
        const Spacer(
          flex: 2,
        )
      ],
    );
  }
}
