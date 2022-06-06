import 'package:flutter/material.dart';

import 'package:mpi_front/models/models.dart';

class ArtefactPreview extends StatelessWidget {
  const ArtefactPreview({
    Key? key,
    required this.order,
  }) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(order.artefact.url),
      title: Text(order.artefact.name),
      subtitle: Text([
        if (order.price != null) 'Цена ${order.price}',
        if (order.datelimit != null) 'До ${formatDateTime(order.datelimit!)}',
      ].join('   ')),
    );
  }

  String formatDateTime(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }
}
