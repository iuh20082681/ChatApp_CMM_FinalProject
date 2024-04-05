import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:equatable/equatable.dart';

import '../../../../configs/resources/data_state.dart';
import '../../../../shared/enums/enums.dart';
import '../../data/models/user_model.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/check_email_existed_usecase.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/registry_new_user_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LogoutUsecase logoutUsecase;
  final CheckEmailExistedUseCase checkEmailExistedUseCase;
  final RegistryNewUserUseCase registryNewUserUseCase;
  final LoginUsecase loginUsecase;

  AuthBloc({
    required this.logoutUsecase,
    required this.checkEmailExistedUseCase,
    required this.registryNewUserUseCase,
    required this.loginUsecase,
  }) : super(UnAuthenticated()) {
    on<CheckEmailRequested>((event, emit) async {
      emit(EmailCheckLoading());
      emit(UnAuthenticated());

      if (EmailValidator.validate(event.email)) {
        emit(ValidateEmailSuccess());
        emit(UnAuthenticated());

        final dataState =
            await checkEmailExistedUseCase.call(email: event.email);

        if (dataState is DataSuccess && dataState.data != null) {
          emit(EmailCheckSucceed(dataState.data!));
          emit(UnAuthenticated());
        } else {
          emit(EmailCheckError(dataState.exception!));
          emit(UnAuthenticated());
        }
      } else {
        emit(const ValidateEmailFailed(error: "Invalid Email"));
        emit(UnAuthenticated());
      }
    });

    on<RegisterRequested>((event, emit) async {
      emit(RegisterLoading());

      if (event.password.toLowerCase() == event.passwordConfirm.toLowerCase()) {
        final User user = User(
          email: event.email,
          hashPassword: event.passwordConfirm,
          status: USERSTATUS.active,
          profile: Profile(name: event.name),
        );

        final dataState = await registryNewUserUseCase.call(user: user);

        if (dataState is DataSuccess && dataState.data != null) {
          emit(RegisterSucceed(dataState.data!));
        } else {
          emit(RegisterFailed(dataState.exception!));
        }
      }
    });

    on<LoginRequested>((event, emit) async {
      emit(LoginLoading());

      final dataState =
          await loginUsecase.call(email: event.email, password: event.password);

      if (dataState is DataSuccess && dataState.data!.email != null) {
        emit(LoginSucceed());
        emit(Authenticated(dataState.data!));
      } else {
        emit(LoginFailed());
        emit(UnAuthenticated());
      }
    });

    on<LogOutRequested>((event, emit) {
      emit(LogoutLoading());
      emit(UnAuthenticated());
    });
  }
}
