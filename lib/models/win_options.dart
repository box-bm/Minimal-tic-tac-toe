enum WinOption {
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

extension WinOptionExtension on WinOption {
  bool validate(int x, int y) {
    switch (this) {
      case WinOption.firstRow:
        return x == 0 && (y == 0 || y == 1 || y == 2);
      case WinOption.secondRow:
        return x == 1 && (y == 0 || y == 1 || y == 2);
      case WinOption.thirdRow:
        return x == 2 && (y == 0 || y == 1 || y == 2);
      case WinOption.firstColumn:
        return y == 0 && (x == 0 || x == 1 || x == 2);
      case WinOption.secondColumn:
        return y == 1 && (x == 0 || x == 1 || x == 2);
      case WinOption.thirdColumn:
        return y == 2 && (x == 0 || x == 1 || x == 2);
      case WinOption.firstDiagonal:
        return (x == 0 && y == 0) || (x == 1 && y == 1) || (x == 2 && y == 2);
      case WinOption.secondDiagonal:
        return (x == 2 && y == 0) || (x == 1 && y == 1) || (x == 0 && y == 2);
      case WinOption.none:
        return false;
      case WinOption.tie:
        return false;
    }
  }
}
