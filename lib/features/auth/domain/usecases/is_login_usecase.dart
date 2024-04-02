import '../repositories/auth_repository.dart';

class IsLoginUsecase {
  final AuthRepository authRepository;

  IsLoginUsecase({required this.authRepository});

  Future<bool> call() async {
    return authRepository.isLogin();
  }
}
