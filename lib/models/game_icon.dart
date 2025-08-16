import 'package:minimal_tic_tac_toe/common.dart';
import 'package:minimal_tic_tac_toe/repository/available_icons.dart';

class GameIcon {
  final IconData icon;
  final String id;
  final String Function(BuildContext context)? name;

  const GameIcon(this.id, this.icon, {this.name});

  factory GameIcon.fromCodePoint(int codePoint) {
    var icon = icons.firstWhere((e) => e.icon.codePoint == codePoint);
    return icon;
  }
}
