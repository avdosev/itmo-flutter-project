// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Information _$InformationFromJson(Map<String, dynamic> json) => Information(
      id: Identifier.fromJson(json['id']),
      acceptedUser: json['acceptedUser'] == null
          ? null
          : User.fromJson(json['acceptedUser'] as Map<String, dynamic>),
      createdUser: User.fromJson(json['createdUser'] as Map<String, dynamic>),
      title: json['title'] as String,
      description: json['description'] as String,
      information: json['information'] as String?,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$InformationToJson(Information instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'information': instance.information,
      'createdUser': instance.createdUser,
      'acceptedUser': instance.acceptedUser,
      'price': instance.price,
    };
