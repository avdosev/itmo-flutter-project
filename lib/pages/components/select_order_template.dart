import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mpi_front/api/network.dart';
import 'package:mpi_front/models/models.dart';
import 'package:mpi_front/widgets/artifact_preview.dart';
import 'package:mpi_front/widgets/loader.dart';

class TemplateOrderSelector extends HookWidget {
  const TemplateOrderSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final asyncArtifacts = useMemoized(() => Network.I.templates());
    final snapshot = useFuture(asyncArtifacts);
    if (!snapshot.hasData) {
      return const Loader();
    }
    final templates = snapshot.data!;
    return Scaffold(
      appBar: AppBar(title: Text('Артефакты, шаблоны')),
      body: ListView(
        children: templates
            .map(
              (e) => ArtifactPreview(
                artifact: e,
                action: () => Navigator.of(context).pop(e),
              ),
            )
            .toList(),
      ),
    );
  }
}
