import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'features/auth/data/datasources/auth_services.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/usecases/check_email_existed_usecase.dart';
import 'features/auth/domain/usecases/login_usecase.dart';
import 'features/auth/domain/usecases/logout_usecase.dart';
import 'features/auth/domain/usecases/registry_new_user_usecase.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

final getIt = GetIt.instance;

Future<void> setUpDI() async {
  // Blocs
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(
      logoutUsecase: getIt.call(),
      checkEmailExistedUseCase: getIt.call(),
      registryNewUserUseCase: getIt.call(),
      loginUsecase: getIt.call(),
    ),
  );

  // Usecases

  getIt.registerLazySingleton<LogoutUsecase>(
    () => LogoutUsecase(
      authRepository: getIt.call(),
    ),
  );

  getIt.registerLazySingleton<CheckEmailExistedUseCase>(
    () => CheckEmailExistedUseCase(
      authRepository: getIt.call(),
    ),
  );

  getIt.registerLazySingleton<RegistryNewUserUseCase>(
    () => RegistryNewUserUseCase(
      authRepository: getIt.call(),
    ),
  );

  getIt.registerLazySingleton<LoginUsecase>(
    () => LoginUsecase(
      authRepository: getIt.call(),
    ),
  );

  // Repositories
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authServices: getIt.call(),
    ),
  );

  // Datasources

  getIt.registerLazySingleton<AuthServices>(
    () => AuthServices(
      getIt.call(),
    ),
  );

  getIt.registerSingleton<Dio>(Dio());
}
