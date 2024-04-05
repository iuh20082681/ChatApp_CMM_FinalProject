import '../../../../configs/resources/data_state.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class LogoutUsecase {
  final AuthRepository authRepository;

  LogoutUsecase({required this.authRepository});

  Future<DataState<User>> call({required String email}) {
    return authRepository.findUserByEmail(email: email);
  }
}
