// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notice _$NotificationFromJson(Map<String, dynamic> json) => Notice(
      wasRead: json['wasRead'] as bool,
      text: json['text'] as String,
      orderId:
          json['orderId'] == null ? null : Identifier.fromJson(json['orderId']),
    );

Map<String, dynamic> _$NotificationToJson(Notice instance) => <String, dynamic>{
      'wasRead': instance.wasRead,
      'text': instance.text,
      'orderId': instance.orderId,
    };
