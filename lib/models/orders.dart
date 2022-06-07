import 'package:mpi_front/models/artefact.dart';
import 'package:mpi_front/models/identifier.dart';

class Orders {
  final List<Order> orders;

  Orders({
    required this.orders,
  });
}

class Order {
  final Artefact artefact;
  final DateTime? datelimit;
  final int? price;
  final Identifier id;

  Order({
    required this.artefact,
    required this.datelimit,
    required this.price,
    required this.id,
  });
}
