import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_tic_tac_toe/bloc/players/players_bloc.dart';
import 'package:minimal_tic_tac_toe/common.dart';

class GameTitle extends StatelessWidget {
  const GameTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayersBloc, PlayersState>(builder: (context, state) {
      return Column(
        children: [
          Text("Minimal",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: context.read<PlayersBloc>().state.player1.color)),
          Text("Tic tac toe",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: context.read<PlayersBloc>().state.player2.color)),
        ],
      );
    });
  }
}
