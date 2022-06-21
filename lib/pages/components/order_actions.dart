import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mpi_front/api/network.dart';
import 'package:mpi_front/models/models.dart';
import 'package:mpi_front/stores/app_state.dart';
import 'package:mpi_front/utils/buit.dart';
import 'package:provider/provider.dart';

import 'select_stalker.dart';

class OrderActions extends StatelessWidget {
  final Order order;
  final VoidCallback onUpdate;

  const OrderActions({
    super.key,
    required this.order,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    final app = context.watch<AppState>();
    final messenger = ScaffoldMessenger.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (app.activeUserType.isBaruga) ...[
          if (order.acceptedUser == null) ...[
            ElevatedButton(
              onPressed: () async {
                await Network.I.acceptOrder(order.id);
                messenger.showSnackBar(SnackBar(
                  content: Text('заказ принят'),
                ));
                onUpdate();
              },
              child: Text('принять'),
            ),
            ElevatedButton(
              onPressed: () async {
                await Network.I.declineOrder(order.id);
                messenger.showSnackBar(SnackBar(
                  content: Text('заказ отклонен'),
                ));
                onUpdate();
              },
              child: Text('отказать'),
            ),
          ] else if (order.acceptedUser?.id == app.me.id) ...[
            if (order.assignedUser == null)
              ElevatedButton(
                onPressed: () async {
                  // TODO: выбор сталкера
                  final stalker = await Navigator.of(context).push<User>(
                    MaterialPageRoute(
                      builder: (context) => StalkerSelector(),
                    ),
                  );
                  if (stalker == null) {
                    messenger.showSnackBar(SnackBar(
                      content: Text('сталкер не выбран'),
                    ));
                    return;
                  }
                  Network.I.suggestOrder(
                    stalkerId: stalker.id,
                    orderId: order.id,
                  );
                  messenger.showSnackBar(SnackBar(
                    content: Text('сталкеру отправлено приглашение'),
                  ));
                  onUpdate();
                },
                child: Text('Назначить сталкера'),
              ),
            // ElevatedButton(
            //   onPressed: () async {
            //     await Network.I.declineOrder(order.id);
            //     messenger.showSnackBar(SnackBar(
            //       content: Text('заказ отклонен'),
            //     ));
            //     onUpdate();
            //   },
            //   child: Text('отказать'),
            // ),
          ],
        ],
        if (app.activeUserType.isStalker) ...[
          if (order.assignedUser == null &&
              order.info.suggestedUserId == app.me.id) ...[
            ElevatedButton(
              onPressed: () async {
                await Network.I.acceptOrder(order.id);
                messenger.showSnackBar(SnackBar(
                  content: Text('заказ принят'),
                ));
                onUpdate();
              },
              child: Text('принять'),
            ),
            ElevatedButton(
              onPressed: () async {
                await Network.I.declineOrder(order.id);
                messenger.showSnackBar(SnackBar(
                  content: Text('заказ отклонен'),
                ));
                onUpdate();
              },
              child: Text('отказать'),
            ),
          ]
        ],
      ].separated(const SizedBox(height: 10)),
    );
  }
}
