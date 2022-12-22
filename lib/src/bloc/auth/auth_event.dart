part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class AuthEventAppStart extends AuthEvent {}

class AuthEventCheckPhone extends AuthEvent{
  final String phone;

  AuthEventCheckPhone({required this.phone});

  @override
  List<Object?> get props => [phone];
}

class AuthEventLoggedIn extends AuthEvent {
  final String password;
  const AuthEventLoggedIn({required this.password});

  @override
  List<Object?> get props => [password];
}

class AuthEventLoggedOut extends AuthEvent {}
