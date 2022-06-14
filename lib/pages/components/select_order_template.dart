import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mpi_front/models/models.dart';
import 'package:mpi_front/widgets/artefact_preview.dart';

class ArtefactTemplate extends Order {
  String get name => artefact.name;
  ArtefactTemplate({
    required super.price,
    required super.artefact,
  }) : super(id: Identifier.fromString('0'), datelimit: null);
}

final templates = [
  ArtefactTemplate(
    artefact: Artefact(
      name: "Медуза",
      url: "assets/artefacts/meduza.jpg",
    ),
    price: 10000,
  ),
  ArtefactTemplate(
    artefact: Artefact(
      name: "Выверт",
      url: "assets/artefacts/vuvert.jpg",
    ),
    price: 10000,
  ),
  ArtefactTemplate(
    artefact: Artefact(
      name: "Грави",
      url: "assets/artefacts/gravi.jpg",
    ),
    price: 10000,
  ),
  ArtefactTemplate(
    artefact: Artefact(
      name: "Кровь камня",
      url: "assets/artefacts/krov.jpg",
    ),
    price: 10000,
  ),
];

class TemplateOrderSelector extends StatelessWidget {
  const TemplateOrderSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Артефакты, шаблоны')),
      body: ListView(
        children: templates
            .map(
              (e) => ArtefactPreview(
                order: e,
                action: () => Navigator.of(context).pop(e),
              ),
            )
            .toList(),
      ),
    );
  }
}
