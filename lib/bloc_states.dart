import 'package:minimal_tic_tac_toe/bloc/settings/current_theme_cubit.dart';
import 'package:minimal_tic_tac_toe/bloc/settings/sounds_cubit.dart';
import 'package:minimal_tic_tac_toe/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_tic_tac_toe/bloc/players/players_bloc.dart';
import 'package:minimal_tic_tac_toe/bloc/tic_tac_toe/tic_tac_toe_bloc.dart';

class BlocAppStates extends StatelessWidget {
  final Widget child;

  const BlocAppStates({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<PlayersBloc>(create: (context) => PlayersBloc()),
      BlocProvider<TicTacToeBloc>(create: (context) => TicTacToeBloc()),
      BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
      BlocProvider<SoundsCubit>(create: (context) => SoundsCubit())
    ], child: child);
  }
}
