import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/usecases/is_login_usecase.dart';
import '../../domain/usecases/login_with_email_and_password_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IsLoginUsecase isLoginUsecase;
  final LoginWithEmailAndPasswordUsecase loginWithEmailAndPasswordUsecase;
  final LogoutUsecase logoutUsecase;

  AuthBloc({
    required this.logoutUsecase,
    required this.loginWithEmailAndPasswordUsecase,
    required this.isLoginUsecase,
  }) : super(UnAuthenticated()) {
    on<RegisterRequested>((event, emit) {
      emit(AuthLoading());
    });

    on<LoginRequested>((event, emit) async {
      if (event.email == "tristannguyen" && event.password == "vaicuc") {
        emit(AuthLoading());
        emit(LoginSucceed());
        emit(Authenticated(email: event.email));
      } else {
        emit(AuthLoading());
        emit(LoginFailed());
        emit(UnAuthenticated());
      }
    });

    on<LogOutRequested>((event, emit) async {
      emit(AuthLoading());

      try {
        logoutUsecase.call();
      } catch (error) {
        emit(UnAuthenticated());
      }
    });
  }
}
