import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:minimal_tic_tac_toe/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_tic_tac_toe/bloc/players/players_bloc.dart';
import 'package:minimal_tic_tac_toe/bloc/tic_tac_toe/tic_tac_toe_bloc.dart';

class BlocAppStates extends StatelessWidget {
  final Widget child;
  const BlocAppStates({super.key, required this.child});

  Future<InitializationStatus> _initGoogleMobileAds() {
    return MobileAds.instance.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<PlayersBloc>(create: (context) => PlayersBloc()),
      BlocProvider<TicTacToeBloc>(create: (context) => TicTacToeBloc())
    ], child: child);
  }
}
