import 'package:flutter/material.dart';

import 'package:mpi_front/models/models.dart';
import 'package:itertools/itertools.dart';

class NoticePreview extends StatelessWidget {
  final Notice notice;
  final VoidCallback? action;

  const NoticePreview({
    super.key,
    required this.notice,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: action,
      title: Text(notice.text),
      subtitle: Text('Заказ №${notice.orderId}'),
      trailing: action == null ? null : const Icon(Icons.chevron_right),
    );
  }
}
