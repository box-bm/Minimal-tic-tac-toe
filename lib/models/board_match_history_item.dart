import 'package:minimal_tic_tac_toe/models/board.dart';
import 'package:minimal_tic_tac_toe/models/match_result.dart';

class BoardMatchHistoryItem {
  final int? playerWinner;
  final DateTime dateTime;
  final MatchResult matchResult;
  final Board board;

  const BoardMatchHistoryItem({
    this.playerWinner,
    required this.dateTime,
    required this.matchResult,
    required this.board,
  });
}
