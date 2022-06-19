import 'package:json_annotation/json_annotation.dart';
import 'package:mpi_front/models/artifact.dart';
import 'package:mpi_front/models/identifier.dart';
import 'package:mpi_front/models/user.dart';

part 'orders.g.dart';

@JsonSerializable()
class Order {
  @JsonKey(name: 'order')
  final OrderInfo info;
  final User createdUser;
  final User? acceptedUser;
  final User? assignedUser;
  @JsonKey(name: 'orderStatus')
  final OrderStatus status;
  final Artifact artifact;

  Order({
    required this.artifact,
    required this.acceptedUser,
    required this.assignedUser,
    required this.createdUser,
    required this.info,
    required this.status,
  });

  static Order fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);

  Identifier get id => info.id;
}

@JsonSerializable()
class OrderInfo {
  final Identifier id;
  final Identifier artifactId;
  final double price;
  final String? completionDate; // null,
  // final Identifier createdUserId; // 1,
  // final String? acceptedUserId; // null,
  // final String? assignedUserId; // null,
  // final String? suggestedUserId; // null,

  OrderInfo({
    required this.id,
    required this.artifactId,
    required this.price,
    required this.completionDate,
  });

  static OrderInfo fromJson(Map<String, dynamic> json) =>
      _$OrderInfoFromJson(json);
  Map<String, dynamic> toJson() => _$OrderInfoToJson(this);
}

@JsonSerializable()
class OrderStatus {
  final Identifier id;
  final String name;

  OrderStatus({
    required this.id,
    required this.name,
  });

  static OrderStatus fromJson(Map<String, dynamic> json) =>
      _$OrderStatusFromJson(json);
  Map<String, dynamic> toJson() => _$OrderStatusToJson(this);
}
