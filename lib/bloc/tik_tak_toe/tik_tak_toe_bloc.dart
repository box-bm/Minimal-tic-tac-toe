import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tik_tak_toe/models/board_item.dart';
import 'package:tik_tak_toe/models/player.dart';
import 'package:tik_tak_toe/models/win_options.dart';

part 'tik_tak_toe_event.dart';
part 'tik_tak_toe_state.dart';

class TikTakToeBloc extends Bloc<TikTakToeEvent, TikTakToeState> {
  TikTakToeBloc() : super(const TikTakToeInitial()) {
    on<CreateNewBoard>((event, emit) {
      var board = createBoardByDimensions(event.size ?? state.boardSize);

      emit(TikTakToeInitial(
          players: event.players ?? state.players,
          playerTurnIndex: state.playerTurnIndex,
          board: board,
          boardSize: event.size ?? state.boardSize));
    });
    on<InitBoard>((event, emit) {
      add(CreateNewBoard(players: event.players, size: event.size));
    });
    on<ResetBoard>((event, emit) {
      add(const CreateNewBoard());
    });
    on<SelectOption>((event, emit) {
      var newBoard = state.board;
      newBoard[event.x][event.y].select(state.players[state.playerTurnIndex]);

      WinOption winner = validateCurrentPlayerWins(
          newBoard, state.players[state.playerTurnIndex]);

      if (winner == WinOption.none) {
        emit(TikTakToeInitial(
          players: state.players,
          playerTurnIndex: state.playerTurnIndex == 1 ? 0 : 1,
          board: newBoard,
          boardSize: state.boardSize,
        ));
      } else if (winner == WinOption.tie) {
        emit(NoWinner(
          players: state.players,
          playerTurnIndex: state.playerTurnIndex,
          board: newBoard,
          boardSize: state.boardSize,
        ));
      } else {
        emit(GameWon(
          playerWinner: state.players.elementAt(state.playerTurnIndex),
          players: state.players,
          playerTurnIndex: state.playerTurnIndex,
          winOption: winner,
          board: newBoard,
          boardSize: state.boardSize,
        ));
      }
    });
    on<ChangeBoardSize>((event, emit) {
      add(CreateNewBoard(size: event.size));
    });
  }

  WinOption validateCurrentPlayerWins(
      List<List<BoardItem?>> board, Player currentPlayer) {
    // Check rows
    for (int row = 0; row < 3; row++) {
      if (board[row][0]?.selectedByPlayer == currentPlayer &&
          board[row][0]?.selectedByPlayer == board[row][1]?.selectedByPlayer &&
          board[row][0]?.selectedByPlayer == board[row][2]?.selectedByPlayer) {
        switch (row) {
          case 0:
            return WinOption.firstRow;
          case 1:
            return WinOption.secondRow;
          case 2:
            return WinOption.thirdRow;
        }
      }
    }

    // Check columns
    for (int col = 0; col < 3; col++) {
      if (board[0][col]?.selectedByPlayer == currentPlayer &&
          board[0][col]?.selectedByPlayer == board[1][col]?.selectedByPlayer &&
          board[0][col]?.selectedByPlayer == board[2][col]?.selectedByPlayer) {
        switch (col) {
          case 0:
            return WinOption.firstColumn;
          case 1:
            return WinOption.secondColumn;
          case 2:
            return WinOption.thirdColumn;
        }
      }
    }

    // Check diagonals
    if (board[0][0]?.selectedByPlayer == currentPlayer &&
        board[0][0]?.selectedByPlayer == board[1][1]?.selectedByPlayer &&
        board[0][0]?.selectedByPlayer == board[2][2]?.selectedByPlayer) {
      return WinOption.firstDiagonal;
    }
    if (board[2][0]?.selectedByPlayer == currentPlayer &&
        board[2][0]?.selectedByPlayer == board[1][1]?.selectedByPlayer &&
        board[2][0]?.selectedByPlayer == board[0][2]?.selectedByPlayer) {
      return WinOption.secondDiagonal;
    }

    for (int row = 0; row < 3; row++) {
      for (int col = 0; col < 3; col++) {
        if (board[row][col]?.selectedByPlayer == null) {
          return WinOption.none;
        }
      }
    }

    return WinOption.tie;
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
