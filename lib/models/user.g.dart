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
      nickname: json['nickname'] as String?,
      imagePath: json['imagePath'] as String?,
      email: json['email'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'nickname': instance.nickname,
      'imagePath': instance.imagePath,
      'email': instance.email,
      'role': instance.role,
    };

const _$UserTypeEnumMap = {
  UserType.client: 'Client',
  UserType.baruga: 'Huckster',
  UserType.stalker: 'Stalker',
  UserType.informer: 'Informer',
  UserType.dealer: 'WeaponDealer',
  UserType.courer: 'Courier',
  UserType.unknown: '',
};
