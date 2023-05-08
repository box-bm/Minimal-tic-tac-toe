import 'package:tik_tak_toe/common.dart';

String getPlayerName(
    BuildContext context, int playerNumber, String? playerName) {
  if (playerName == null) {
    return S.of(context).player(playerNumber + 1);
  }

  if (playerName.isEmpty) {
    return S.of(context).player(playerNumber + 1);
  }

  return playerName;
}
