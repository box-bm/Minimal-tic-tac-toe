import 'package:tik_tak_toe/common.dart';
import 'package:tik_tak_toe/screens/icon_selection.dart';
import 'package:tik_tak_toe/screens/matches_history.dart';
import 'package:tik_tak_toe/screens/presentation.dart';
import 'package:tik_tak_toe/screens/settings.dart';
import 'package:tik_tak_toe/screens/tik_tak_toe.dart';

Map<String, Widget Function(BuildContext)> routes = {
  Presentation.route: (p0) => const Presentation(),
  TikTakToe.route: (p0) => const TikTakToe(),
  Settings.route: (p0) => const Settings(),
  IconSelection.route: (p0) => const IconSelection(),
  MatchesHistory.route: (p0) => const MatchesHistory()
};
