import 'package:equatable/equatable.dart';

import '../../../../shared/enums/enums.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String password;
  final String username;
  final USERSTATUS userstatus;

  const User({
    required this.id,
    required this.email,
    required this.password,
    required this.username,
    required this.userstatus,
  });

  User copyWith({
    String? id,
    String? email,
    String? password,
    String? username,
    USERSTATUS? userstatus,
  }) =>
      User(
        id: id ?? this.id,
        email: email ?? this.email,
        password: password ?? this.password,
        username: username ?? this.username,
        userstatus: userstatus ?? this.userstatus,
      );

  @override
  List<Object?> get props => [id, email, password, username, userstatus];
}
