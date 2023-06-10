import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:minimal_tic_tac_toe/models/ai.dart';
import 'package:minimal_tic_tac_toe/models/board.dart';
import 'package:minimal_tic_tac_toe/models/board_item.dart';
import 'package:minimal_tic_tac_toe/models/board_match_history_item.dart';
import 'package:minimal_tic_tac_toe/models/match_result.dart';

part 'tic_tac_toe_event.dart';

part 'tic_tac_toe_state.dart';

class TicTacToeBloc extends Bloc<TicTacToeEvent, TicTacToeState> {
  TicTacToeBloc() : super(const TicTacToeInitial()) {
    on<CreateNewBoard>((event, emit) {
      var board = _createBoardByDimensions(state.board.boardSize);

      emit(TicTacToeInitial(
          currentPlayer: state.currentPlayer,
          board: board,
          history: state.history));
    });

    on<ResetBoard>((event, emit) {
      add(CreateNewBoard());
      emit(Restarted(
          singlePlayer: state.singlePlayer,
          currentPlayer: state.currentPlayer,
          board: state.board,
          history: state.history));
    });

    on<ClearHistory>((event, emit) {
      var board = _createBoardByDimensions(state.board.boardSize);

      emit(TicTacToeInitial(
          currentPlayer: state.currentPlayer, board: board, history: const []));
    });

    on<PressItemButton>((event, emit) {
      if (state is! ChoosingItem) {
        emit(ChoosingItem(
            singlePlayer: state.singlePlayer,
            currentPlayer: state.currentPlayer,
            board: state.board,
            playerWinner: state.playerWinner,
            history: state.history));
      }
    });

    on<CancelPressButton>((event, emit) {
      emit(TicTacToeInitial(
          singlePlayer: state.singlePlayer,
          currentPlayer: state.currentPlayer,
          board: state.board,
          playerWinner: state.playerWinner,
          history: state.history));
    });

    on<MakeAIMove>((event, emit) async {
      AI ai = AI(playerNumber: state.currentPlayer);
      var move = ai.findBestMove(state.board.board);
      add(PressItemButton());
      add(SelectOption(move.row, move.row));
    });

    on<SelectOption>((event, emit) async {
      if (state is ChoosingItem) {
        var newBoard = state.board;
        newBoard.board[event.x][event.y].select(state.currentPlayer);

        MatchResult matchResult =
            _validateCurrentPlayerWins(newBoard.board, state.currentPlayer);

        if (matchResult == MatchResult.none) {
          emit(TicTacToeInitial(
              currentPlayer: changePlayer(state.currentPlayer),
              board: newBoard,
              history: state.history,
              playerWinner: null));

          if (state.singlePlayer) {
            await Future.delayed(const Duration(seconds: 2));
            add(MakeAIMove());
          }
        } else {
          var winner =
              matchResult == MatchResult.tie ? null : state.currentPlayer;

          var boardResult = newBoard.copyWith(
              playerWinner: winner,
              matchResult: matchResult,
              board: newBoard.board,
              boardSize: state.board.boardSize);

          emit(GameEnded(
            playerWinner: winner,
            currentPlayer: matchResult == MatchResult.tie
                ? state.currentPlayer
                : changePlayer(state.currentPlayer),
            board: boardResult,
            history: [
              ...state.history,
              BoardMatchHistoryItem(
                  dateTime: DateTime.now(),
                  matchResult: matchResult,
                  playerWinner: winner,
                  board: boardResult)
            ],
            singlePlayer: state.singlePlayer,
          ));
        }
      }
    });
    on<ChangeBoardSize>((event, emit) {
      emit(TicTacToeInitial(
          singlePlayer: state.singlePlayer,
          board: _createBoardByDimensions(event.size),
          currentPlayer: state.currentPlayer,
          playerWinner: state.playerWinner));
    });
  }

  int changePlayer(int currentPlayer) {
    return currentPlayer == 0 ? 1 : 0;
  }

  MatchResult _validateCurrentPlayerWins(
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

  Board _createBoardByDimensions(int dimensions) {
    if (dimensions < 3) {
      throw "dimensions needs to be greather than 3";
    }

    List<List<BoardItem>> matchResult = [];
    for (var x = 0; x < dimensions; x++) {
      List<BoardItem> xOptions = [];
      for (var y = 0; y < dimensions; y++) {
        xOptions.add(BoardItem(xPosition: x, yPosition: y));
      }
      matchResult.add(xOptions);
    }
    return Board(
        boardSize: dimensions,
        matchResult: MatchResult.none,
        board: matchResult);
  }
}
