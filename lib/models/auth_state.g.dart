// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthState _$AuthStateFromJson(Map<String, dynamic> json) => AuthState(
      token: json['token'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      role: Role.fromJson(json['role'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthStateToJson(AuthState instance) => <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
      'role': instance.role,
    };

Role _$RoleFromJson(Map<String, dynamic> json) => Role(
      id: $enumDecode(_$UserTypeEnumMap, json['id']),
      name: json['name'] as String,
    );

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

const _$UserTypeEnumMap = {
  UserType.client: 'Клиент',
  UserType.baruga: 'Барыга',
  UserType.stalker: 'Сталкер',
  UserType.informer: 'Информатор',
  UserType.unknown: '',
};
