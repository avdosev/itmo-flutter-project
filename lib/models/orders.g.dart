// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      artifact: Artifact.fromJson(json['artifact'] as Map<String, dynamic>),
      acceptedUser: json['acceptedUser'] == null
          ? null
          : User.fromJson(json['acceptedUser'] as Map<String, dynamic>),
      assignedUser: json['assignedUser'] == null
          ? null
          : User.fromJson(json['assignedUser'] as Map<String, dynamic>),
      createdUser: User.fromJson(json['createdUser'] as Map<String, dynamic>),
      order: OrderInfo.fromJson(json['order'] as Map<String, dynamic>),
      status: OrderStatus.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'order': instance.order,
      'createdUser': instance.createdUser,
      'acceptedUser': instance.acceptedUser,
      'assignedUser': instance.assignedUser,
      'status': instance.status,
      'artifact': instance.artifact,
    };

OrderInfo _$OrderInfoFromJson(Map<String, dynamic> json) => OrderInfo(
      id: Identifier.fromJson(json['id']),
      artifactId: Identifier.fromJson(json['artifactId']),
      price: (json['price'] as num).toDouble(),
      completionDate: json['completionDate'] as String?,
    );

Map<String, dynamic> _$OrderInfoToJson(OrderInfo instance) => <String, dynamic>{
      'id': instance.id,
      'artifactId': instance.artifactId,
      'price': instance.price,
      'completionDate': instance.completionDate,
    };

OrderStatus _$OrderStatusFromJson(Map<String, dynamic> json) => OrderStatus(
      id: Identifier.fromJson(json['id']),
      name: json['name'] as String,
    );

Map<String, dynamic> _$OrderStatusToJson(OrderStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
