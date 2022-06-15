import 'package:json_annotation/json_annotation.dart';
import 'package:mpi_front/models/models.dart';

part 'auth_state.g.dart';

@JsonSerializable()
class AuthState {
  final String token;
  final User user;
  final Role role;

  AuthState({
    required this.token,
    required this.user,
    required this.role,
  });

  static AuthState fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);
  Map<String, dynamic> toJson() => _$AuthStateToJson(this);
}

@JsonSerializable()
class Role {
  final UserType id;
  final String name;

  Role({
    required this.id,
    required this.name,
  });

  static Role fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);
  Map<String, dynamic> toJson() => _$RoleToJson(this);
}
