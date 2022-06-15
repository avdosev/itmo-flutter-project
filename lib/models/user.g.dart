// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: Identifier.fromJson(json['id']),
      role: $enumDecode(_$UserTypeEnumMap, json['role']),
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      middleName: json['middleName'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'role': _$UserTypeEnumMap[instance.role],
    };

const _$UserTypeEnumMap = {
  UserType.client: 2,
  UserType.baruga: 1,
  UserType.stalker: 3,
  UserType.informer: 4,
  UserType.unknown: 5,
};
