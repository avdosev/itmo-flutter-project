import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mpi_front/models/models.dart';
import 'package:mpi_front/widgets/artifact_preview.dart';

class TemplateOrderSelector extends StatelessWidget {
  const TemplateOrderSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final templates = <Artifact>[];
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
