import '../../../../configs/resources/data_state.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class RegistryNewUserUseCase {
  final AuthRepository authRepository;

  const RegistryNewUserUseCase({required this.authRepository});

  Future<DataState<User>> call({required User user}) async {
    return authRepository.registryNewUser(user: user);
  }
}
