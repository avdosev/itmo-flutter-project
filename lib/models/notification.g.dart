// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) => Notification(
      wasRead: json['wasRead'] as bool,
      text: json['text'] as String,
      orderId:
          json['orderId'] == null ? null : Identifier.fromJson(json['orderId']),
    );

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'wasRead': instance.wasRead,
      'text': instance.text,
      'orderId': instance.orderId,
    };
