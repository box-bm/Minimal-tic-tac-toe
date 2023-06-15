import 'package:minimal_tic_tac_toe/common.dart';

String getPlayerName(
    BuildContext context, int playerNumber, String? playerName) {
  if (playerName == null || playerName.isEmpty) {
    return S.of(context).player(playerNumber + 1);
  }

  return playerName;
}
