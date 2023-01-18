import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mpi_front/api/network.dart';
import 'package:mpi_front/models/models.dart';
import 'package:mpi_front/utils/buit.dart';
import 'package:mpi_front/widgets/loader.dart';

import 'components/weapon_actions.dart';

class WeaponPage extends HookWidget {
  final Identifier weaponId;

  const WeaponPage({Key? key, required this.weaponId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final version = useState(0);
    final asyncArtifacts =
        useMemoized(() => Network.I.weapon(weaponId), [version.value]);
    final snapshot = useFuture(asyncArtifacts);
    if (!snapshot.hasData) {
      return const Loader();
    }
    final information = snapshot.data!;
    return Scaffold(
      appBar: AppBar(title: Text("Оружие, \"${information.weapon.title}\"")),
      body: Column(
        children: [
          const SizedBox(height: 40),
          ...<Widget>[
            Text('Что: ${information.weapon.title}'),
            Text('Описание: ${information.weapon.description}'),
            Text('Цена: ${information.weapon.price}'),
          ].separated(
            const Divider(
              indent: 20,
              endIndent: 20,
            ),
          ),
          const SizedBox(height: 40),
          WeaponActions(
            weapon: information,
            onUpdate: () => version.value += 1,
          ),
        ],
      ),
    );
  }
}
