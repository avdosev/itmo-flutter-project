import 'package:json_annotation/json_annotation.dart';
import 'package:mpi_front/models/artifact.dart';
import 'package:mpi_front/models/identifier.dart';
import 'package:mpi_front/models/user.dart';

part 'information.g.dart';

@JsonSerializable()
class Information {
  final Identifier id;
  final String title;
  final String description;
  final String? information;
  final User createdUser;
  final User? acceptedUser;
  final double price;

  Information({
    required this.id,
    required this.acceptedUser,
    required this.createdUser,
    required this.title,
    required this.description,
    required this.information,
    required this.price,
  });

  static Information fromJson(Map<String, dynamic> json) =>
      _$InformationFromJson(json);
  Map<String, dynamic> toJson() => _$InformationToJson(this);
}
