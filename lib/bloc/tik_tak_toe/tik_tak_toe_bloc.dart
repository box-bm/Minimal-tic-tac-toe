import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tik_tak_toe/models/board_item.dart';
import 'package:tik_tak_toe/models/player.dart';

part 'tik_tak_toe_event.dart';
part 'tik_tak_toe_state.dart';

class TikTakToeBloc extends Bloc<TikTakToeEvent, TikTakToeState> {
  TikTakToeBloc({
    required List<Player> players,
    required int playerTurnIndex,
  }) : super(
          TikTakToeInitial(
            playerTurnIndex: playerTurnIndex,
            players: players,
          ),
        ) {
    on<InitBoard>((event, emit) {
      add(const CreateNewBoard());
    });

    on<CreateNewBoard>((event, emit) {
      var board = createBoardByDimensions(event.size);

      emit(TikTakToeInitial(
          players: state.players,
          playerTurnIndex: state.playerTurnIndex,
          board: board,
          boardSize: state.boardSize));
    });
    on<ResetBoard>((event, emit) {
      add(CreateNewBoard(size: state.boardSize));
    });
    on<SelectOption>((event, emit) {
      var newBoard = state.board;
      newBoard[event.x][event.y].select(state.players[state.playerTurnIndex]);

      var winner = validateCurrentPlayerWins(
          newBoard, state.players[state.playerTurnIndex]);

      if (winner) {
        emit(Finished(
          players: state.players,
          playerTurnIndex: state.playerTurnIndex == 1 ? 0 : 1,
          board: newBoard,
          boardSize: state.boardSize,
        ));
      } else {
        emit(TikTakToeInitial(
          players: state.players,
          playerTurnIndex: state.playerTurnIndex == 1 ? 0 : 1,
          board: newBoard,
          boardSize: state.boardSize,
        ));
      }
    });
    on<ChangeBoardSize>((event, emit) {
      add(CreateNewBoard(size: event.size));
    });
  }

  bool validateCurrentPlayerWins(
      List<List<BoardItem?>> board, Player currentPlayer) {
    // Check rows
    for (int row = 0; row < 3; row++) {
      if (board[row][0]?.selectedByPlayer == currentPlayer &&
          board[row][0]?.selectedByPlayer == board[row][1]?.selectedByPlayer &&
          board[row][0]?.selectedByPlayer == board[row][2]?.selectedByPlayer) {
        return true;
      }
    }

    // Check columns
    for (int col = 0; col < 3; col++) {
      if (board[0][col]?.selectedByPlayer == currentPlayer &&
          board[0][col]?.selectedByPlayer == board[1][col]?.selectedByPlayer &&
          board[0][col]?.selectedByPlayer == board[2][col]?.selectedByPlayer) {
        return true;
      }
    }

    // Check diagonals
    if (board[0][0]?.selectedByPlayer == currentPlayer &&
        board[0][0]?.selectedByPlayer == board[1][1]?.selectedByPlayer &&
        board[0][0]?.selectedByPlayer == board[2][2]?.selectedByPlayer) {
      return true;
    }
    if (board[2][0]?.selectedByPlayer == currentPlayer &&
        board[2][0]?.selectedByPlayer == board[1][1]?.selectedByPlayer &&
        board[2][0]?.selectedByPlayer == board[0][2]?.selectedByPlayer) {
      return true;
    }

    return false;
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
