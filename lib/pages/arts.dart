import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:mpi_front/api/network.dart';
import 'package:mpi_front/models/artifact.dart';
import 'package:mpi_front/stores/app_state.dart';
import 'package:mpi_front/utils/buit.dart';
import 'package:mpi_front/utils/navigation.dart';
import 'package:mpi_front/widgets/artifact_preview.dart';
import 'package:mpi_front/widgets/empty_state.dart';
import 'package:mpi_front/widgets/loader.dart';
import 'package:provider/provider.dart';

class ArtifactsPage extends HookWidget {
  const ArtifactsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final asyncArtifacts = useMemoized(() => Network.I.templates());
    final snapshot = useFuture(asyncArtifacts);
    if (!snapshot.hasData) {
      return const Loader();
    }
    final orders = snapshot.data!;
    return Scaffold(
      appBar: AppBar(
        title: Text('Артефакты'),
      ),
      body: orders.isEmpty
          ? const EmptyState()
          : ListView.separated(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return ArtifactPreview(
                  artifact: order,
                  action: () => context.to(() => ArtPage(artifact: order)),
                );
              },
              separatorBuilder: (_, __) => const Divider(color: Colors.black),
            ),
    );
  }
}

class ArtPage extends HookWidget {
  final Artifact artifact;

  const ArtPage({
    Key? key,
    required this.artifact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Артефакт'),
      ),
      body: Column(
          children: [
            const SizedBox(height: 40),
            ...<Widget>[
              Text('Артефакт: ${artifact.name}'),
              Text('Id: ${artifact.id}'),
              Text('Цена: ${artifact.price}'),
              Text('Количество дней: ${artifact.averageDays}'),
            ].separated(
              const Divider(
                indent: 20,
                endIndent: 20,
              ),
            ),
          ],
        ),
    );
  }
}
