import 'package:flutter/cupertino.dart';
import 'package:mpi_front/api/network.dart';
import 'package:mpi_front/models/models.dart';

class OrdersState extends ChangeNotifier {
  List<Order> orders = [];
  bool isLoading = false;

  OrdersState() {
    load();
  }

  void load() async {
    isLoading = true;
    final result = await Network.I.getOrders();
    isLoading = false;
    orders.addAll(result.orders);
    notifyListeners();
  }
}
