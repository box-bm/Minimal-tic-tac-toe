part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  final String username;
  const UserState({required this.username});

  @override
  List<Object> get props => [username];
}

class AuthIdle extends UserState {
  const AuthIdle({super.username = ""});
}

class SignedIn extends UserState {
  const SignedIn({required super.username});
}

class SignedOut extends UserState {
  const SignedOut({super.username = ""});
}

class AuthError extends UserState {
  final String error;
  const AuthError(this.error, {super.username = ""});
}
