import '../entities/user.dart';

abstract class AuthRepository {
  Future<bool> isLogin();

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> logOut();
}
