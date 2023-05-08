import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:tik_tak_toe/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tik_tak_toe/bloc/players/players_bloc.dart';
import 'package:tik_tak_toe/bloc/tik_tak_toe/tik_tak_toe_bloc.dart';

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
      BlocProvider<TikTakToeBloc>(create: (context) => TikTakToeBloc())
    ], child: child);
  }
}
