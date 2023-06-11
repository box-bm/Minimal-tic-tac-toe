import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_tic_tac_toe/bloc/settings/current_theme_cubit.dart';
import 'package:minimal_tic_tac_toe/common.dart';
import 'package:minimal_tic_tac_toe/bloc_states.dart';
import 'package:minimal_tic_tac_toe/routes.dart';
import 'package:minimal_tic_tac_toe/screens/presentation.dart';
import 'package:minimal_tic_tac_toe/theme/theme_builder.dart';

class TicTacToeApp extends StatelessWidget {
  const TicTacToeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocAppStates(
        child: BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, state) => MaterialApp(
        theme: buildTheme(Brightness.light),
        darkTheme: buildTheme(Brightness.dark),
        themeMode: state,
        showSemanticsDebugger: false,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        title: "Minimal tic tac toe",
        supportedLocales: S.delegate.supportedLocales,
        initialRoute: Presentation.route,
        routes: routes,
      ),
    ));
  }
}
