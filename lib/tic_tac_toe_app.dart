
import 'package:minimal_tic_tac_toe/common.dart';
import 'package:minimal_tic_tac_toe/bloc_states.dart';
import 'package:minimal_tic_tac_toe/routes.dart';
import 'package:minimal_tic_tac_toe/screens/presentation.dart';
import 'package:minimal_tic_tac_toe/theme/theme_builder.dart';

class TicTacToeApp extends StatefulWidget {
  const TicTacToeApp({super.key});

  @override
  State<TicTacToeApp> createState() => _TicTacToeAppState();
}

class _TicTacToeAppState extends State<TicTacToeApp> {
  @override
  Widget build(BuildContext context) {
    return BlocAppStates(
        child: MaterialApp(
      theme: buildTheme(Brightness.light),
      darkTheme: buildTheme(Brightness.dark),
      showSemanticsDebugger: false, // kDebugMode,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      initialRoute: Presentation.route,
      routes: routes,
    ));
  }
}
