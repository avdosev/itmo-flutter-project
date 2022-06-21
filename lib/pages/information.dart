import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mpi_front/api/network.dart';
import 'package:mpi_front/models/models.dart';
import 'package:mpi_front/utils/buit.dart';
import 'package:mpi_front/widgets/loader.dart';

import 'components/information_actions.dart';

class InformationPage extends HookWidget {
  final Identifier informationId;

  const InformationPage({Key? key, required this.informationId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final version = useState(0);
    final asyncArtifacts = useMemoized(
        () => Network.I.information(informationId), [version.value]);
    final snapshot = useFuture(asyncArtifacts);
    if (!snapshot.hasData) {
      return const Loader();
    }
    final information = snapshot.data!;
    return Scaffold(
      appBar: AppBar(title: Text("Информация, \"${information.title}\"")),
      body: Column(
        children: [
          const SizedBox(height: 40),
          ...<Widget>[
            Text('Что: ${information.title}'),
            Text('Описание: ${information.description}'),
            Text(
                'Информация: ${information.information ?? 'станет доступна после покупки'}'),
            Text('Цена: ${information.price}'),
          ].separated(
            const Divider(
              indent: 20,
              endIndent: 20,
            ),
          ),
          const SizedBox(height: 40),
          InformationActions(
            information: information,
            onUpdate: () => version.value += 1,
          ),
        ],
      ),
    );
  }
}
