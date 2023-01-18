import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:mpi_front/api/network.dart';
import 'package:mpi_front/models/models.dart';
import 'package:mpi_front/stores/app_state.dart';
import 'package:mpi_front/utils/buit.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

import 'select_stalker.dart';

class WeaponActions extends StatelessWidget {
  final WeaponOrder weapon;
  final VoidCallback onUpdate;

  const WeaponActions({
    super.key,
    required this.weapon,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    final app = context.watch<AppState>();
    final messenger = ScaffoldMessenger.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (app.activeUserType.isStalker) ...[
          if (weapon.acquiredUser == null) ...[
            ElevatedButton(
              onPressed: () async {
                final delivery = await showDialog<String>(
                    context: context, builder: (_) => _DelveryDialog());
                if (delivery == null || delivery.isEmpty) return;
                await Network.I.buyWeapon(id: weapon.id, delivery: delivery);
                messenger.showSnackBar(SnackBar(
                  content: Text('оружие куплено'),
                ));
                onUpdate();
              },
              child: Text('купить'),
            ),
          ]
        ],
        if (app.activeUserType.isDealer) ...[
          if (weapon.status.weaponBuiedStalker)
            ElevatedButton(
              onPressed: () async {
                final stalker = await Navigator.of(context).push<User>(
                  MaterialPageRoute(
                    builder: (context) => CourierSelector(),
                  ),
                );
                if (stalker == null) {
                  messenger.showSnackBar(SnackBar(
                    content: Text('курьер не выбран'),
                  ));
                  return;
                }
                Network.I.suggestWeapon(
                  userId: stalker.id,
                  id: weapon.id,
                );
                messenger.showSnackBar(SnackBar(
                  content: Text('курьеру отправлено приглашение'),
                ));
                onUpdate();
              },
              child: Text('Назначить курьера'),
            ),
        ],
        if (app.activeUserType.isCourier) ...[
          if (weapon.status.weaponBuiedStalker) ...[
            ElevatedButton(
              onPressed: () async {
                await Network.I.acceptWeapon(id: weapon.id);
                messenger.showSnackBar(SnackBar(
                  content: Text('заказ принят'),
                ));
                onUpdate();
              },
              child: Text('принять'),
            ),
            ElevatedButton(
              onPressed: () async {
                await Network.I.declineWeapon(id: weapon.id);
                messenger.showSnackBar(SnackBar(
                  content: Text('заказ отклонен'),
                ));
                onUpdate();
              },
              child: Text('отказать'),
            ),
          ],
          if (weapon.acceptedCourier?.id == app.me.id &&
              weapon.status.atTheCourier) ...[
            ElevatedButton(
              onPressed: () async {
                await Network.I.deliverWeapon(id: weapon.id);
                messenger.showSnackBar(SnackBar(
                  content: Text('заказ доставлен'),
                ));
                onUpdate();
              },
              child: Text('доставить'),
            ),
          ]
        ],
      ].separated(const SizedBox(height: 10)),
    );
  }
}

class _DelveryDialog extends HookWidget {
  const _DelveryDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();
    return Dialog(
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Укажите адрес доставки",
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              controller: textController,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(textController.text);
                    },
                    child: Text("Ok")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Close")),
              ].separated(const SizedBox(width: 20)),
            )
          ],
        ),
      ),
    );
  }
}
