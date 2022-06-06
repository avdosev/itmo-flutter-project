import 'package:mpi_front/models/artefact.dart';

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

  Order({
    required this.artefact,
    required this.datelimit,
    required this.price,
  });
}
