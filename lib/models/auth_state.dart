import 'package:json_annotation/json_annotation.dart';
import 'package:mpi_front/models/models.dart';

part 'auth_state.g.dart';

@JsonSerializable()
class AuthState {
  final String token;
  final User user;

  AuthState({
    required this.token,
    required this.user,
  });

  static AuthState fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);
  Map<String, dynamic> toJson() => _$AuthStateToJson(this);
}
