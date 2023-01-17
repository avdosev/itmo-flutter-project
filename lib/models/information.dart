import 'package:json_annotation/json_annotation.dart';
import 'package:mpi_front/models/artifact.dart';
import 'package:mpi_front/models/identifier.dart';
import 'package:mpi_front/models/user.dart';

part 'information.g.dart';

@JsonSerializable()
class Information {
  Identifier get id => info.id;
  String get title => info.title;
  String get description => info.description;
  String? get information => info.information;
  double get price => info.price;
  final User createdUser;
  final User? acceptedUser;

  @JsonKey(name: 'information')
  final InformationInfo info;

  Information({
    required this.acceptedUser,
    required this.createdUser,
    required this.info
  });

  static Information fromJson(Map<String, dynamic> json) =>
      _$InformationFromJson(json);
  Map<String, dynamic> toJson() => _$InformationToJson(this);
}

@JsonSerializable()
class InformationInfo {
  final Identifier id;
  final String title;
  final String description;
  final String? information;
  final double price;

  InformationInfo({
    required this.id,
    required this.title,
    required this.description,
    required this.information,
    required this.price,
  });

  static InformationInfo fromJson(Map<String, dynamic> json) =>
      _$InformationInfoFromJson(json);
  Map<String, dynamic> toJson() => _$InformationInfoToJson(this);
}
