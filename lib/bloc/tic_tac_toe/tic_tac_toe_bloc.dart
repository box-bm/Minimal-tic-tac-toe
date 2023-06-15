import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:minimal_tic_tac_toe/models/ai.dart';
import 'package:minimal_tic_tac_toe/models/board.dart';
import 'package:minimal_tic_tac_toe/models/board_item.dart';
import 'package:minimal_tic_tac_toe/models/board_match_history_item.dart';
import 'package:minimal_tic_tac_toe/models/levels.dart';
import 'package:minimal_tic_tac_toe/models/match_result.dart';
import 'package:minimal_tic_tac_toe/utils/validate_player_wins.dart';

part 'tic_tac_toe_event.dart';

part 'tic_tac_toe_state.dart';

class TicTacToeBloc extends Bloc<TicTacToeEvent, TicTacToeState> {
  TicTacToeBloc() : super(const TicTacToeInitial()) {
    on<InitSinglePlayerGame>((event, emit) {
      emit(TicTacToeInitial(singlePlayer: true, iaLevel: event.level));
      add(CreateNewBoard());
    });
    on<InitMultiplayerPlayerGame>((event, emit) {
      emit(const TicTacToeInitial(singlePlayer: false, iaLevel: null));
      add(CreateNewBoard());
    });
    on<CreateNewBoard>((event, emit) {
      var board = _createBoardByDimensions(state.board.boardSize);

      emit(TicTacToeInitial(
          iaLevel: state.iaLevel,
          singlePlayer: state.singlePlayer,
          currentPlayer: state.currentPlayer,
          board: board,
          history: state.history));

      if (state.singlePlayer && state.currentPlayer == 1) {
        add(MakeAIMove());
      }
    });

    on<ResetBoard>((event, emit) {
      add(CreateNewBoard());
      emit(Restarted(
          iaLevel: state.iaLevel,
          singlePlayer: state.singlePlayer,
          currentPlayer: state.currentPlayer,
          board: state.board,
          history: state.history));
    });

    on<ClearHistory>((event, emit) {
      var board = _createBoardByDimensions(state.board.boardSize);

      emit(TicTacToeInitial(
          iaLevel: state.iaLevel,
          singlePlayer: state.singlePlayer,
          currentPlayer: state.currentPlayer,
          board: board,
          history: const []));
    });

    on<PressItemButton>((event, emit) {
      if (state is! ChoosingItem) {
        emit(ChoosingItem(
            iaLevel: state.iaLevel,
            singlePlayer: state.singlePlayer,
            currentPlayer: state.currentPlayer,
            board: state.board,
            playerWinner: state.playerWinner,
            history: state.history));
      }
    });

    on<CancelPressButton>((event, emit) {
      emit(TicTacToeInitial(
          iaLevel: state.iaLevel,
          singlePlayer: state.singlePlayer,
          currentPlayer: state.currentPlayer,
          board: state.board,
          playerWinner: state.playerWinner,
          history: state.history));
    });

    on<MakeAIMove>((event, emit) async {
      var move = const AI()
          .findMoveByLevel(state.board.board, state.iaLevel ?? Level.easy);
      add(PressItemButton());
      add(SelectOption(move.row, move.col));
    });

    on<SelectOption>((event, emit) async {
      if (state is ChoosingItem) {
        var newBoard = state.board;
        newBoard.board[event.x][event.y].select(state.currentPlayer);

        MatchResult matchResult =
            validatePlayerWins(newBoard.board, state.currentPlayer);

        if (matchResult == MatchResult.none) {
          emit(TicTacToeInitial(
              iaLevel: state.iaLevel,
              singlePlayer: state.singlePlayer,
              currentPlayer: changePlayer(state.currentPlayer),
              board: newBoard,
              history: state.history,
              playerWinner: null));

          if (state.singlePlayer && state.currentPlayer == 1) {
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
            iaLevel: state.iaLevel,
            playerWinner: winner,
            currentPlayer: changePlayer(state.currentPlayer),
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
          iaLevel: state.iaLevel,
          singlePlayer: state.singlePlayer,
          board: _createBoardByDimensions(event.size),
          currentPlayer: state.currentPlayer,
          playerWinner: state.playerWinner));
    });
  }

  int changePlayer(int currentPlayer) {
    return currentPlayer == 0 ? 1 : 0;
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
        singlePlayer: state.singlePlayer,
        iaLevel: state.iaLevel,
        boardSize: dimensions,
        matchResult: MatchResult.none,
        board: matchResult);
  }
}
