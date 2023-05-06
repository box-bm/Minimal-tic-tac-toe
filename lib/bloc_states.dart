import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tik_tak_toe/bloc/players/players_bloc.dart';
import 'package:tik_tak_toe/bloc/tik_tak_toe/tik_tak_toe_bloc.dart';

class BlocAppStates extends StatelessWidget {
  final Widget child;
  const BlocAppStates({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<PlayersBloc>(create: (context) => PlayersBloc()),
      BlocProvider<TikTakToeBloc>(create: (context) => TikTakToeBloc())
    ], child: child);
  }
}
