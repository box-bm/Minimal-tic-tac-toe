import 'package:minimal_tic_tac_toe/common.dart';
import 'package:minimal_tic_tac_toe/models/game_icon.dart';
import 'package:minimal_tic_tac_toe/models/player.dart';

const Player defaultPlayer1 = Player(
  id: "player1",
  playerName: "",
  color: Color.fromARGB(255, 17, 161, 180),
  gameIcon: GameIcon("circle", Icons.circle_outlined),
);

const Player defaultPlayer2 = Player(
  id: "player2",
  playerName: "",
  color: Color.fromARGB(255, 238, 183, 18),
  gameIcon: GameIcon("cross", Icons.close_outlined),
);
