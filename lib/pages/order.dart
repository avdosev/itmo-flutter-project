import 'package:flutter/material.dart';
import 'package:mpi_front/models/models.dart';

class OrderPage extends StatelessWidget {
  final Identifier orderId;

  const OrderPage({Key? key, required this.orderId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Заказ")),
      body: Container(),
    );
  }
}
