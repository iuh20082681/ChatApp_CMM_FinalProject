import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class LoginWithEmailAndPasswordUsecase {
  final AuthRepository authRepository;

  LoginWithEmailAndPasswordUsecase({required this.authRepository});

  Future<User> call({required String email, required String password}) async {
    return authRepository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
