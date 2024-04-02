import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.email,
    required super.password,
    required super.username,
    required super.userstatus,
  });
}
