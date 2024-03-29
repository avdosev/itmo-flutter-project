import 'package:flutter/material.dart';

import 'package:mpi_front/models/models.dart';
import 'package:itertools/itertools.dart';

class InformationPreview extends StatelessWidget {
  final Information information;
  final VoidCallback? action;

  const InformationPreview({
    super.key,
    required this.information,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: action,
      title: Text(information.title),
      subtitle: Text('Информация от $_author'),
      trailing: (action == null ? null : const Icon(Icons.chevron_right)),
    );
  }

  String get _author {
    final bynames = [
      information.createdUser.firstName,
      information.createdUser.middleName,
      information.createdUser.lastName
    ].notNull.join(' ');
    if (bynames.isNotEmpty) {
      return bynames;
    }
    return [information.createdUser.role.runame, information.createdUser.id]
        .join(' ');
  }
}

class WeaponPreview extends StatelessWidget {
  final WeaponOrder weapon;
  final VoidCallback? action;

  const WeaponPreview({
    super.key,
    required this.weapon,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: action,
      title: Text(weapon.weapon.title),
      subtitle: Text('Оружие от $_author'),
      trailing: (action == null ? null : const Icon(Icons.chevron_right)),
    );
  }

  String get _author {
    final bynames = [
      weapon.createdUser.firstName,
      weapon.createdUser.middleName,
      weapon.createdUser.lastName
    ].notNull.join(' ');
    if (bynames.isNotEmpty) {
      return bynames;
    }
    return [weapon.createdUser.role.runame, weapon.createdUser.id]
        .join(' ');
  }
}
