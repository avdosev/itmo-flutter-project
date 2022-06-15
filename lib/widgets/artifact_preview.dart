import 'package:flutter/material.dart';

import 'package:mpi_front/models/models.dart';

class ArtifactPreview extends StatelessWidget {
  const ArtifactPreview({
    Key? key,
    required this.artifact,
    this.order,
    this.action,
  }) : super(key: key);

  final Artifact artifact;
  final Order? order;
  final VoidCallback? action;

  @override
  Widget build(BuildContext context) {
    final price = order?.order.price ?? artifact.price;
    final datelimit = order?.order.completionDate;
    return ListTile(
      onTap: action,
      leading: artifact.url == null ? null : Image.asset(artifact.url!),
      title: Text(artifact.name),
      subtitle: Text([
        if (price != null) 'Цена $price',
        if (datelimit != null) 'До $datelimit',
      ].join('   ')),
      trailing: action == null ? null : const Icon(Icons.chevron_right),
    );
  }

  String formatDateTime(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }
}
