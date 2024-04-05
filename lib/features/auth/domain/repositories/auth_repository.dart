import '../../../../configs/resources/data_state.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<DataState<User>> findUserByEmail({required String email});

  Future<DataState<User>> registryNewUser({required User user});

  Future<DataState<User>> login(
      {required String email, required String password});
}
