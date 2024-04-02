part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class LoginSucceed extends AuthState {}

class LoginFailed extends AuthState {}

class RegisterSucceed extends AuthState {}

class RegisterFailed extends AuthState {}

class UnAuthenticated extends AuthState {}

class Authenticated extends AuthState {
  final String email;
  const Authenticated({required this.email});
}
