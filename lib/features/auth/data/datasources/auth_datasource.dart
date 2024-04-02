import '../../domain/entities/user.dart';

abstract class AuthDatasource {
  Future<bool> isLogin();

  Future<User> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> logout();

  Future<User> registerNewUser({
    required String email,
    required String password,
    required String name,
  });
}
