import 'package:flutter/material.dart';
import 'package:mpi_front/pages/orders.dart';
import 'package:mpi_front/stores/app_state.dart';
import 'package:mpi_front/utils/navigation.dart';
import 'package:provider/provider.dart';

import '../stores/orders.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final app = context.watch<AppState>();
    return Scaffold(
      appBar: AppBar(title: const Text("Меню")),
      body: ListView(
        children: [
          if (app.activeUserType.isBaruga)
            ListTile(
              title: Text('Заказы, непринятые'),
              onTap: () =>
                  context.to(() => OrdersPage(type: OrdersType.notAccepted)),
            ),
          if (app.activeUserType.isBaruga)
            ListTile(
              title: Text('Заказы, принятые'),
              onTap: () =>
                  context.to(() => OrdersPage(type: OrdersType.inProgress)),
            ),
          if (app.activeUserType.isStalker)
            ListTile(
              title: Text('Заказы'),
              onTap: () => context.to(() => OrdersPage(type: OrdersType.all)),
            ),
          if (app.activeUserType.isStalker)
            ListTile(
              title: Text('Информация'),
              onTap: () =>
                  context.to(() => OrdersPage(type: OrdersType.inform)),
            ),
        ],
      ),
    );
  }
}
