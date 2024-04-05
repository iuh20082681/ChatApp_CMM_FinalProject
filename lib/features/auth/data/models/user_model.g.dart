// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      email: json['email'] as String?,
      hashPassword: json['hash_password'] as String?,
      status: $enumDecodeNullable(_$USERSTATUSEnumMap, json['status']),
      profile: json['profile'] == null
          ? null
          : Profile.fromJson(json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  writeNotNull('hash_password', instance.hashPassword);
  writeNotNull('status', _$USERSTATUSEnumMap[instance.status]);
  writeNotNull('profile', instance.profile?.toJson());
  return val;
}

const _$USERSTATUSEnumMap = {
  USERSTATUS.active: 'ACTIVE',
  USERSTATUS.inactive: 'INACTIVE',
  USERSTATUS.terminated: 'TERMINATED',
};

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  return val;
}
