import 'package:json_annotation/json_annotation.dart';

import '../../../../shared/enums/enums.dart';
import '../../domain/entities/user.dart';

part 'user_model.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
  includeIfNull: false,
)
class UserModel extends User {
  const UserModel({
    required super.email,
    required super.hashPassword,
    required super.status,
    required super.profile,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromUser(User user) => UserModel(
        email: user.email,
        hashPassword: user.hashPassword,
        status: user.status,
        profile: user.profile,
      );
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
  includeIfNull: false,
)
class Profile {
  final String? name;

  Profile({
    this.name,
  });

  Profile copyWith({
    String? name,
  }) =>
      Profile(
        name: name ?? this.name,
      );

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
