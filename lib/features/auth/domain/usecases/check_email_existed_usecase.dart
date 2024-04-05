import '../../../../configs/resources/data_state.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class CheckEmailExistedUseCase {
  final AuthRepository authRepository;

  const CheckEmailExistedUseCase({required this.authRepository});

  Future<DataState<User>> call({required String email}) async {
    return authRepository.findUserByEmail(email: email);
  }
}
