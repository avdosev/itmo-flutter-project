// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeaponOrder _$WeaponOrderFromJson(Map<String, dynamic> json) => WeaponOrder(
      requestedUser: json['requestedUser'] == null
          ? null
          : User.fromJson(json['requestedUser'] as Map<String, dynamic>),
      acquiredUser: json['acquiredUser'] == null
          ? null
          : User.fromJson(json['acquiredUser'] as Map<String, dynamic>),
      suggestedCourier: json['suggestedCourier'] == null
          ? null
          : User.fromJson(json['suggestedCourier'] as Map<String, dynamic>),
      weapon: Weapon.fromJson(json['weapon'] as Map<String, dynamic>),
      createdUser: User.fromJson(json['createdUser'] as Map<String, dynamic>),
      acceptedCourier: json['acceptedCourier'] == null
          ? null
          : User.fromJson(json['acceptedCourier'] as Map<String, dynamic>),
      status: OrderStatus.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeaponOrderToJson(WeaponOrder instance) =>
    <String, dynamic>{
      'weapon': instance.weapon,
      'createdUser': instance.createdUser,
      'requestedUser': instance.requestedUser,
      'acquiredUser': instance.acquiredUser,
      'suggestedCourier': instance.suggestedCourier,
      'acceptedCourier': instance.acceptedCourier,
      'orderStatus': instance.status,
    };

Weapon _$WeaponFromJson(Map<String, dynamic> json) => Weapon(
      id: Identifier.fromJson(json['id']),
      title: json['title'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$WeaponToJson(Weapon instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
    };
