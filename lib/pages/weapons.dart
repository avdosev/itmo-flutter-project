import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:mpi_front/api/network.dart';
import 'package:mpi_front/stores/app_state.dart';
import 'package:mpi_front/widgets/artifact_preview.dart';
import 'package:mpi_front/widgets/empty_state.dart';
import 'package:mpi_front/widgets/information_preview.dart';
import 'package:mpi_front/widgets/loader.dart';
import 'package:provider/provider.dart';

class WeaponsPage extends HookWidget {
  const WeaponsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final asyncArtifacts = useMemoized(() => Network.I.weapons());
    final snapshot = useFuture(asyncArtifacts);
    if (!snapshot.hasData) {
      return const Loader();
    }
    final orders = snapshot.data!;
    return Scaffold(
      appBar: AppBar(
        title: Text('Оружие'),
      ),
      body: orders.isEmpty
          ? const EmptyState()
          : ListView.separated(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final info = orders[index];
                return WeaponPreview(
                  weapon: info,
                  action: () => context.push('/weapon/${info.id}'),
                );
              },
              separatorBuilder: (_, __) => const Divider(color: Colors.black),
            ),
    );
  }
}
