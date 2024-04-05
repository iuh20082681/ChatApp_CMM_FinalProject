part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class CheckEmailRequested extends AuthEvent {
  final String email;
  const CheckEmailRequested({required this.email});
}

class RegisterRequested extends AuthEvent {
  final String email;
  final String password;
  final String passwordConfirm;
  final String name;

  const RegisterRequested({
    required this.email,
    required this.password,
    required this.passwordConfirm,
    required this.name,
  });
}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  const LoginRequested({
    required this.email,
    required this.password,
  });
}

class LogOutRequested extends AuthEvent {}
