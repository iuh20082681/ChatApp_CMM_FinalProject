import 'package:equatable/equatable.dart';

import '../../../../shared/enums/enums.dart';
import '../../data/models/user_model.dart';

class User extends Equatable {
  final String? email;
  final String? hashPassword;
  final USERSTATUS? status;
  final Profile? profile;

  const User({
    required this.email,
    required this.hashPassword,
    required this.profile,
    required this.status,
  });

  User copyWith({
    String? email,
    String? hashPassword,
    USERSTATUS? status,
    Profile? profile,
  }) =>
      User(
        email: email ?? this.email,
        hashPassword: hashPassword ?? this.hashPassword,
        status: status ?? this.status,
        profile: profile ?? this.profile,
      );

  @override
  List<Object?> get props => [email, hashPassword, status, profile];
}
