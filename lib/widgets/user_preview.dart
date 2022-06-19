import 'package:flutter/material.dart';

import 'package:mpi_front/models/models.dart';
import 'package:itertools/itertools.dart';

class UserPreview extends StatelessWidget {
  final User user;
  final VoidCallback? action;
  final Widget? actionWidget;

  const UserPreview({
    super.key,
    required this.user,
    this.action,
    this.actionWidget,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: action,
      title: Text(_title),
      // subtitle: Text(user.),
      trailing: actionWidget ??
          (action == null ? null : const Icon(Icons.chevron_right)),
    );
  }

  String get _title {
    final bynames =
        [user.firstName, user.middleName, user.lastName].notNull.join(' ');
    if (bynames.isNotEmpty) {
      return bynames;
    }
    return [user.role.runame, user.id].join(' ');
  }
}
