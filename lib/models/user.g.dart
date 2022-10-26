// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      url: json['url'] as String?,
      id: Identifier.fromJson(json['id']),
      role: $enumDecode(_$UserTypeEnumMap, json['role']),
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      middleName: json['middleName'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'url': instance.url,
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'role': instance.role,
    };

const _$UserTypeEnumMap = {
  UserType.client: 'Клиент',
  UserType.baruga: 'Барыга',
  UserType.stalker: 'Сталкер',
  UserType.informer: 'Информатор',
  UserType.unknown: '',
};
