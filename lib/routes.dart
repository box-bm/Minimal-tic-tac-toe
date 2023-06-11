import 'package:minimal_tic_tac_toe/common.dart';
import 'package:minimal_tic_tac_toe/screens/icon_selection.dart';
import 'package:minimal_tic_tac_toe/screens/matches_history.dart';
import 'package:minimal_tic_tac_toe/screens/presentation.dart';
import 'package:minimal_tic_tac_toe/screens/settings.dart';
import 'package:minimal_tic_tac_toe/screens/tic_tac_toe.dart';

Map<String, Widget Function(BuildContext)> routes = {
  Presentation.route: (p0) => const Presentation(),
  TicTacToe.route: (p0) => const TicTacToe(),
  Settings.route: (p0) => const Settings(),
  IconSelection.route: (p0) => const IconSelection(),
  MatchesHistory.route: (p0) => const MatchesHistory(),
};
