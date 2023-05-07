import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tik_tak_toe/models/board_item.dart';
import 'package:tik_tak_toe/models/match_result.dart';

part 'tik_tak_toe_event.dart';
part 'tik_tak_toe_state.dart';

class TikTakToeBloc extends Bloc<TikTakToeEvent, TikTakToeState> {
  TikTakToeBloc() : super(const TikTakToeInitial()) {
    on<CreateNewBoard>((event, emit) {
      var board = createBoardByDimensions(state.boardSize);

      emit(TikTakToeInitial(
          currentPlayer: state.currentPlayer,
          board: board,
          boardSize: state.boardSize));
    });
    on<ResetBoard>((event, emit) {
      add(CreateNewBoard());
    });

    on<SelectOption>((event, emit) {
      var newBoard = state.board;
      newBoard[event.x][event.y].select(event.playerNumber);

      MatchResult winner =
          validateCurrentPlayerWins(newBoard, event.playerNumber);

      if (winner == MatchResult.none) {
        emit(TikTakToeInitial(
          currentPlayer: changePlayer(state.currentPlayer),
          board: newBoard,
          boardSize: state.boardSize,
        ));
      } else if (winner == MatchResult.tie) {
        emit(GameEnded(
          matchResult: MatchResult.tie,
          playerWinner: null,
          currentPlayer: state.currentPlayer,
          board: newBoard,
          boardSize: state.boardSize,
        ));
      } else {
        emit(GameEnded(
          playerWinner: event.playerNumber,
          currentPlayer: changePlayer(state.currentPlayer),
          matchResult: winner,
          board: newBoard,
          boardSize: state.boardSize,
        ));
      }
    });
    on<ChangeBoardSize>((event, emit) {
      emit(TikTakToeInitial(
          board: createBoardByDimensions(event.size),
          boardSize: event.size,
          currentPlayer: state.currentPlayer,
          playerWinner: state.playerWinner));
    });
  }

  int changePlayer(int currentPlayer) {
    return currentPlayer == 0 ? 1 : 0;
  }

  MatchResult validateCurrentPlayerWins(
      List<List<BoardItem?>> board, int currentPlayer) {
    // Check rows
    for (int row = 0; row < 3; row++) {
      if (board[row][0]?.selectedByPlayerNumber == currentPlayer &&
          board[row][0]?.selectedByPlayerNumber ==
              board[row][1]?.selectedByPlayerNumber &&
          board[row][0]?.selectedByPlayerNumber ==
              board[row][2]?.selectedByPlayerNumber) {
        switch (row) {
          case 0:
            return MatchResult.firstRow;
          case 1:
            return MatchResult.secondRow;
          case 2:
            return MatchResult.thirdRow;
        }
      }
    }

    // Check columns
    for (int col = 0; col < 3; col++) {
      if (board[0][col]?.selectedByPlayerNumber == currentPlayer &&
          board[0][col]?.selectedByPlayerNumber ==
              board[1][col]?.selectedByPlayerNumber &&
          board[0][col]?.selectedByPlayerNumber ==
              board[2][col]?.selectedByPlayerNumber) {
        switch (col) {
          case 0:
            return MatchResult.firstColumn;
          case 1:
            return MatchResult.secondColumn;
          case 2:
            return MatchResult.thirdColumn;
        }
      }
    }

    // Check diagonals
    if (board[0][0]?.selectedByPlayerNumber == currentPlayer &&
        board[0][0]?.selectedByPlayerNumber ==
            board[1][1]?.selectedByPlayerNumber &&
        board[0][0]?.selectedByPlayerNumber ==
            board[2][2]?.selectedByPlayerNumber) {
      return MatchResult.firstDiagonal;
    }
    if (board[2][0]?.selectedByPlayerNumber == currentPlayer &&
        board[2][0]?.selectedByPlayerNumber ==
            board[1][1]?.selectedByPlayerNumber &&
        board[2][0]?.selectedByPlayerNumber ==
            board[0][2]?.selectedByPlayerNumber) {
      return MatchResult.secondDiagonal;
    }

    for (int row = 0; row < 3; row++) {
      for (int col = 0; col < 3; col++) {
        if (board[row][col]?.selectedByPlayerNumber == null) {
          return MatchResult.none;
        }
      }
    }

    return MatchResult.tie;
  }

  List<List<BoardItem>> createBoardByDimensions(int dimensions) {
    if (dimensions < 3) {
      throw "dimensions needs to be greather than 3";
    }

    List<List<BoardItem>> result = [];
    for (var x = 0; x < dimensions; x++) {
      List<BoardItem> xOptions = [];
      for (var y = 0; y < dimensions; y++) {
        xOptions.add(BoardItem(xPosition: x, yPosition: y));
      }
      result.add(xOptions);
    }
    return result;
  }
}
