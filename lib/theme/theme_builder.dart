import 'package:minimal_tic_tac_toe/common.dart';

ThemeData buildTheme(Brightness brightness, {Color? backgroundColor}) =>
    ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 47, 153, 171),
            background: backgroundColor,
            brightness: brightness),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(),
        ));
