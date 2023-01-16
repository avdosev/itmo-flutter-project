import 'package:json_annotation/json_annotation.dart';
import 'package:mpi_front/models/artifact.dart';
import 'package:mpi_front/models/identifier.dart';
import 'package:mpi_front/models/user.dart';

import 'orders.dart';

part 'weapon.g.dart';

@JsonSerializable()
class WeaponOrder {
  final Weapon weapon;
  final User createdUser;
  final User? requestedUser;
  final User? acquiredUser;
  final User? suggestedCourier;
  final User? acceptedCourier;
  @JsonKey(name: 'orderStatus')
  final OrderStatus status;

  WeaponOrder({
    required this.requestedUser,
    required this.acquiredUser,
    required this.suggestedCourier,
    required this.weapon,
    required this.createdUser,
    required this.acceptedCourier,
    required this.status,
  });

  static WeaponOrder fromJson(Map<String, dynamic> json) =>
      _$WeaponOrderFromJson(json);
  Map<String, dynamic> toJson() => _$WeaponOrderToJson(this);

  Identifier get id => weapon.id;
}

@JsonSerializable()
class Weapon {
  final Identifier id;
  final String title;
  final String description;
  final double price;

  Weapon({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
  });

  static Weapon fromJson(Map<String, dynamic> json) => _$WeaponFromJson(json);
  Map<String, dynamic> toJson() => _$WeaponToJson(this);
}
