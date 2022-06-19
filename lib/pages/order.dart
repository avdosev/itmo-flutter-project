import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mpi_front/api/network.dart';
import 'package:mpi_front/models/models.dart';
import 'package:mpi_front/widgets/loader.dart';

class OrderPage extends HookWidget {
  final Identifier orderId;

  const OrderPage({Key? key, required this.orderId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final asyncArtifacts = useMemoized(() => Network.I.order(orderId));
    final snapshot = useFuture(asyncArtifacts);
    if (!snapshot.hasData) {
      return const Loader();
    }
    final order = snapshot.data!;
    return Scaffold(
      appBar: AppBar(title: Text("Заказ, \"${order.artifact.name}\"")),
      body: Column(
        children: [
          const SizedBox(height: 40),
          ...<Widget>[
            Text('Артефакт: ${order.artifact.name}'),
            Text('Сталкер: ${order.assignedUser == null ? 'не' : ''} назначен'),
            Text('Барыга: ${order.acceptedUser == null ? 'не' : ''} назначен'),
            // Text('Куда: ${order.order.price}'),
            Text('Выполнить до: ${order.order.completionDate}'),
            Text('Статус: ${order.status.name}'),
          ].separated(
            const Divider(
              indent: 20,
              endIndent: 20,
            ),
          ),
          const SizedBox(height: 40),
          OrderActions(order: order),
        ],
      ),
    );
  }
}

extension _SeparatedList<T> on List<T> {
  List<T> separated(T separator) {
    final res = <T>[];
    if (isNotEmpty) {
      res.add(first);
    }
    for (var i = 1; i < length; i++) {
      res.add(separator);
      res.add(this[i]);
    }
    return res;
  }
}

class OrderActions extends StatelessWidget {
  final Order order;

  const OrderActions({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [],
    );
  }
}
