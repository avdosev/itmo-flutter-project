import 'package:flutter/cupertino.dart';
import 'package:mpi_front/api/network.dart';
import 'package:mpi_front/models/models.dart';
import 'package:mpi_front/pages/order.dart';
import 'package:mpi_front/stores/app_state.dart';
import 'package:mpi_front/utils/navigation.dart';

enum OrdersType {
  all,
  notAccepted,
  inProgress,
  inform,
}

class OrdersState extends ChangeNotifier {
  List<Order> orders = [];
  bool isLoading = false;
  OrdersType type;
  AppState app;

  OrdersState({
    required this.app,
    required this.type,
  }) {
    load();
  }

  void load() async {
    isLoading = true;
    final result = await Network.I.getOrders();
    isLoading = false;
    orders.addAll(result.orders);
    notifyListeners();
  }

  void doAction(BuildContext context, Order order) {
    context.to(() => OrderPage(orderId: order.id));
  }
}
