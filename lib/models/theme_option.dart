import 'package:minimal_tic_tac_toe/common.dart';

class ThemeOption {
  final ThemeMode mode;
  final BuildContext context;

  const ThemeOption(this.mode, this.context);

  String get name {
    switch (mode) {
      case ThemeMode.dark:
        return S.of(context).darkTheme;

      case ThemeMode.light:
        return S.of(context).lightTheme;

      case ThemeMode.system:
        return S.of(context).systemTheme;
    }
  }
}
