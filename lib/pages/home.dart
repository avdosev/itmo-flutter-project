import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mpi_front/pages/orders.dart';
import 'package:mpi_front/stores/app_state.dart';
import 'package:mpi_front/utils/navigation.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final app = context.watch<AppState>();
    return Scaffold(
      appBar: AppBar(title: const Text("Меню")),
      body: ListView(
        children: [
          ListTile(
            title: Text('Заказы'),
            onTap: () => context.push('/orders/'),
          ),
          if (app.activeUserType.isBaruga || app.activeUserType.isStalker)
            ListTile(
              title: Text('Заказы, доступные'),
              onTap: () => null,
            ),
          if (app.activeUserType.isStalker)
            ListTile(
              title: Text('Информация'),
              onTap: () => null,
            ),
          if (app.activeUserType.isClient)
            ListTile(
              title: Text('Создать заказ'),
              onTap: () => context.push('/order/create'),
            ),
          ListTile(
            title: Text('Выйти'),
            onTap: () => app.logout(),
          ),
        ],
      ),
    );
  }
}
