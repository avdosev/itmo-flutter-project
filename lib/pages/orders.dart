import 'package:flutter/material.dart';
import 'package:mpi_front/stores/orders.dart';
import 'package:mpi_front/widgets/artefact_preview.dart';
import 'package:provider/provider.dart';

class OrdersPage extends StatelessWidget {
  final String title = "Заказы";

  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OrdersState(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: const OrdersView(),
      ),
    );
  }
}

class OrdersView extends StatelessWidget {
  const OrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<OrdersState>();
    if (state.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return ListView.separated(
      itemCount: state.orders.length,
      itemBuilder: (context, index) {
        final order = state.orders[index];
        return ArtefactPreview(order: order);
      },
      separatorBuilder: (_, __) => const Divider(color: Colors.black),
    );
  }
}
