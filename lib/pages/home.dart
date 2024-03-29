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
    final userType = app.activeUserType;
    final size = 10.0;
    return Scaffold(
      appBar: AppBar(title: Text("Меню, ${userType.runame}")),
      body: Column(
        children: [
          ListTile(
            title: Text('Профиль'),
            onTap: () => context.push('/profile/'),
          ),
          ListTile(
            title: Text('Уведомления'),
            onTap: () => context.push('/notifications/'),
            trailing: app.hasNotifications
                ? Container(
                    width: size,
                    height: size,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                  )
                : null,
          ),
          ListTile(
            title: Text('Артефакты'),
            onTap: () => context.push('/artifacts/'),
          ),
          if (!userType.isInformer)
            ListTile(
              title: Text('Заказы'),
              onTap: () => context.push('/orders/'),
            ),
          if (userType.isBaruga || userType.isStalker || userType.isCourier)
            ListTile(
              title: Text('Заказы, доступные'),
              onTap: () => context.push('/orders/available'),
            ),
          if (userType.isStalker || userType.isInformer)
            ListTile(
              title: Text('Информация'),
              onTap: () => context.push('/informations'),
            ),
          if (userType.isStalker || userType.isInformer)
            ListTile(
              title: Text('Информация, доступная'),
              onTap: () => context.push('/informations/available'),
            ),
          if (userType.isStalker || userType.isDealer || userType.isCourier)
            ListTile(
              title: Text('Оружие'),
              onTap: () => context.push('/weapon'),
            ),
          if (userType.isStalker || userType.isDealer || userType.isCourier)
            ListTile(
              title: Text('Оружие, доступное'),
              onTap: () => context.push('/weapon/available'),
            ),
          if (userType.isClient)
            ListTile(
              title: Text('Создать заказ'),
              onTap: () => context.push('/order/create'),
            ),
          if (userType.isInformer)
            ListTile(
              title: Text('Создать информацию'),
              onTap: () => context.push('/information/create'),
            ),
          if (userType.isDealer)
            ListTile(
              title: Text('Создать оружие'),
              onTap: () => context.push('/weapon/create'),
            ),
          const Spacer(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Выйти'),
            onTap: () => app.logout(),
          ),
        ],
      ),
    );
  }
}
