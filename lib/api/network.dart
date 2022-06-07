import 'package:mpi_front/models/models.dart';

class Network {
  static Network get I => Network();

  Future<Orders> getOrders() async {
    await Future.delayed(const Duration(seconds: 1));
    return Orders(orders: [
      Order(
        id: Identifier.fromString('1'),
        artefact: Artefact(
          name: "Медуза",
          url: "assets/artefacts/meduza.jpg",
        ),
        datelimit: DateTime(2022, 5, 10),
        price: 15000,
      ),
      Order(
        id: Identifier.fromString('2'),
        artefact: Artefact(
          name: "Ломоть мяса",
          url: "assets/artefacts/lomot.jpg",
        ),
        datelimit: DateTime(2022, 6, 25),
        price: 35000,
      ),
    ]);
  }
}
