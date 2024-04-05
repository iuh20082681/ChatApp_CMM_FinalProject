part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  final User? user;
  final DioException? exception;

  const AuthState({
    this.user,
    this.exception,
  });

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class LoginLoading extends AuthState {}

class LoginSucceed extends AuthState {}

class LoginFailed extends AuthState {}

class RegisterLoading extends AuthState {}

class RegisterSucceed extends AuthState {
  const RegisterSucceed(User user) : super(user: user);
}

class RegisterFailed extends AuthState {
  const RegisterFailed(DioException exception) : super(exception: exception);
}

class UnAuthenticated extends AuthState {}

class Authenticated extends AuthState {
  const Authenticated(User user) : super(user: user);
}

class EmailCheckLoading extends AuthState {}

class EmailCheckSucceed extends AuthState {
  const EmailCheckSucceed(User user) : super(user: user);
}

class EmailCheckError extends AuthState {
  const EmailCheckError(DioException exception) : super(exception: exception);
}

class ValidateEmailSuccess extends AuthState {}

class ValidateEmailFailed extends AuthState {
  final String error;

  const ValidateEmailFailed({required this.error});
}

class LogoutLoading extends AuthState {}
