import '../../domain/entities/user.dart';
import 'auth_datasource.dart';

class AuthDatasourceImpl implements AuthDatasource {
  @override
  Future<bool> isLogin() async {
    throw UnimplementedError();
  }

  @override
  Future<User> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {
    throw UnimplementedError();
  }

  @override
  Future<User> registerNewUser({
    required String email,
    required String password,
    required String name,
  }) {
    throw UnimplementedError();
  }
}
