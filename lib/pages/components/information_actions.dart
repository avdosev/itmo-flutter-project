import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mpi_front/api/network.dart';
import 'package:mpi_front/models/models.dart';
import 'package:mpi_front/stores/app_state.dart';
import 'package:mpi_front/utils/buit.dart';
import 'package:provider/provider.dart';

import 'select_stalker.dart';

class InformationActions extends StatelessWidget {
  final Information information;
  final VoidCallback onUpdate;

  const InformationActions({
    super.key,
    required this.information,
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
          if (information.acceptedUser == null) ...[
            ElevatedButton(
              onPressed: () async {
                await Network.I.buyInformation(id: information.id);
                messenger.showSnackBar(SnackBar(
                  content: Text('информация куплена'),
                ));
                onUpdate();
              },
              child: Text('купить'),
            ),
          ]
        ],
      ].separated(const SizedBox(height: 10)),
    );
  }
}
