import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'players_event.dart';
part 'players_state.dart';

class PlayersBloc extends Bloc<PlayersEvent, PlayersState> {
  PlayersBloc() : super(PlayersInitial()) {
    on<PlayersEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
