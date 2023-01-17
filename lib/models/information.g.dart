// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Information _$InformationFromJson(Map<String, dynamic> json) => Information(
      acceptedUser: json['acceptedUser'] == null
          ? null
          : User.fromJson(json['acceptedUser'] as Map<String, dynamic>),
      createdUser: User.fromJson(json['createdUser'] as Map<String, dynamic>),
      info:
          InformationInfo.fromJson(json['information'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InformationToJson(Information instance) =>
    <String, dynamic>{
      'createdUser': instance.createdUser,
      'acceptedUser': instance.acceptedUser,
      'information': instance.info,
    };

InformationInfo _$InformationInfoFromJson(Map<String, dynamic> json) =>
    InformationInfo(
      id: Identifier.fromJson(json['id']),
      title: json['title'] as String,
      description: json['description'] as String,
      information: json['information'] as String?,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$InformationInfoToJson(InformationInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'information': instance.information,
      'price': instance.price,
    };
