import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:games_services/games_services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const AuthIdle()) {
    on<GetUserDetails>((event, emit) async {
      var name = await Player.getPlayerName();
      emit(SignedIn(username: name ?? ""));
    });
    on<SignIn>((event, emit) async {
      try {
        if (!(await GameAuth.isSignedIn)) {
          await GameAuth.signIn();
        }
        add(GetUserDetails());
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });
    on<SignOut>((event, emit) async {
      try {
        if (state is SignedIn) {
          await GameAuth.signOut();
          emit(const SignedOut());
        }
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });
  }
}
