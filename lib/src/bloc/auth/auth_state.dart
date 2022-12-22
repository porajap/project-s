part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthStateLoading extends AuthState {}

class AuthStateUninitialized extends AuthState {}

class AuthStateUnauthenticated extends AuthState {
  bool showAlert;
  final String message;

  AuthStateUnauthenticated({this.showAlert = false, this.message = ""});

  @override
  List<Object> get props => [showAlert, message];
}

class AuthStateAuthenticated extends AuthState {}

class AuthStateCheckPhone extends AuthState {
  final ResponseModel res;

  AuthStateCheckPhone({required this.res});

  @override
  List<Object?> get props => [res];
}

class AuthStatePINUnEqual extends AuthState{}

class AuthEventTokenInvalid extends AuthEvent {}
