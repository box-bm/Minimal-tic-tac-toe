import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'game_progress_event.dart';
part 'game_progress_state.dart';

class GameProgressBloc extends Bloc<GameProgressEvent, GameProgressState> {
  GameProgressBloc() : super(GameProgressInitial()) {
    on<GameProgressEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
