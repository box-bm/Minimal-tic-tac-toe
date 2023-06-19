import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_tic_tac_toe/bloc/settings/current_theme_cubit.dart';
import 'package:minimal_tic_tac_toe/bloc/user/user_bloc.dart';
import 'package:minimal_tic_tac_toe/common.dart';
import 'package:minimal_tic_tac_toe/routes.dart';
import 'package:minimal_tic_tac_toe/screens/presentation.dart';
import 'package:minimal_tic_tac_toe/theme/theme_builder.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() => _App();
}

class _App extends State<App> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(SignIn());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
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
            ));
  }
}
