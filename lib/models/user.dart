import 'package:json_annotation/json_annotation.dart';
import 'package:mpi_front/models/identifier.dart';
import 'package:mpi_front/models/user_type.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  // final String url;
  final Identifier id;
  final String? firstName;
  final String? lastName;
  final String? middleName;
  @JsonKey(name: 'roleId')
  final UserType role;

  User({
    // required this.url,
    required this.id,
    required this.role,
    required this.firstName,
    required this.lastName,
    required this.middleName,
  });

  static User fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
