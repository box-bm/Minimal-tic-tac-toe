enum MatchResult {
  none,
  tie,
  firstDiagonal,
  secondDiagonal,
  firstRow,
  secondRow,
  thirdRow,
  firstColumn,
  secondColumn,
  thirdColumn
}

extension MatchResultExtension on MatchResult {
  bool validate(int x, int y) {
    switch (this) {
      case MatchResult.firstRow:
        return x == 0 && (y == 0 || y == 1 || y == 2);
      case MatchResult.secondRow:
        return x == 1 && (y == 0 || y == 1 || y == 2);
      case MatchResult.thirdRow:
        return x == 2 && (y == 0 || y == 1 || y == 2);
      case MatchResult.firstColumn:
        return y == 0 && (x == 0 || x == 1 || x == 2);
      case MatchResult.secondColumn:
        return y == 1 && (x == 0 || x == 1 || x == 2);
      case MatchResult.thirdColumn:
        return y == 2 && (x == 0 || x == 1 || x == 2);
      case MatchResult.firstDiagonal:
        return (x == 0 && y == 0) || (x == 1 && y == 1) || (x == 2 && y == 2);
      case MatchResult.secondDiagonal:
        return (x == 2 && y == 0) || (x == 1 && y == 1) || (x == 0 && y == 2);
      case MatchResult.none:
        return false;
      case MatchResult.tie:
        return false;
    }
  }
}
