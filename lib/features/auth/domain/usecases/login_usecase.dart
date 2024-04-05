import 'dart:io';

import '../../../../configs/resources/data_state.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class LoginUsecase {
  final AuthRepository authRepository;

  const LoginUsecase({required this.authRepository});

  Future<DataState<User>> call(
      {required String email, required String password}) {
    return authRepository.login(email: email, password: password);
  }
}
