import 'package:get_it/get_it.dart';

import 'features/auth/data/datasources/auth_datasource.dart';
import 'features/auth/data/datasources/auth_datasource_impl.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/usecases/is_login_usecase.dart';
import 'features/auth/domain/usecases/login_with_email_and_password_usecase.dart';
import 'features/auth/domain/usecases/logout_usecase.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

final getIt = GetIt.instance;

Future<void> setUpDI() async {
  // Blocs
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(
        logoutUsecase: getIt.call(),
        loginWithEmailAndPasswordUsecase: getIt.call(),
        isLoginUsecase: getIt.call()),
  );

  // Usecases
  getIt.registerLazySingleton<IsLoginUsecase>(
    () => IsLoginUsecase(
      authRepository: getIt.call(),
    ),
  );
  getIt.registerLazySingleton<LoginWithEmailAndPasswordUsecase>(
    () => LoginWithEmailAndPasswordUsecase(
      authRepository: getIt.call(),
    ),
  );
  getIt.registerLazySingleton<LogoutUsecase>(
    () => LogoutUsecase(
      authRepository: getIt.call(),
    ),
  );

  // Repositories
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authDatasource: getIt.call(),
    ),
  );

  // Datasources

  getIt.registerLazySingleton<AuthDatasource>(() => AuthDatasourceImpl());
}
