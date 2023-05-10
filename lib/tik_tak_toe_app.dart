import 'package:tik_tak_toe/common.dart';
import 'package:tik_tak_toe/bloc_states.dart';
import 'package:tik_tak_toe/routes.dart';
import 'package:tik_tak_toe/screens/presentation.dart';
import 'package:tik_tak_toe/theme/theme_builder.dart';

class TikTakToeApp extends StatefulWidget {
  const TikTakToeApp({super.key});

  @override
  State<TikTakToeApp> createState() => _TikTakToeAppState();
}

class _TikTakToeAppState extends State<TikTakToeApp> {
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
