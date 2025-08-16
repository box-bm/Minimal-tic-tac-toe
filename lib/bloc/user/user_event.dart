part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class SignIn extends UserEvent {}

class SignOut extends UserEvent {}

class GetUserDetails extends UserEvent {}
