import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:mpi_front/api/auth_service.dart';
import 'package:mpi_front/api/network.dart';
import 'package:mpi_front/stores/app_state.dart';
import 'package:mpi_front/widgets/artifact_preview.dart';
import 'package:mpi_front/widgets/empty_state.dart';
import 'package:mpi_front/widgets/loader.dart';
import 'package:mpi_front/utils/buit.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

class ProfilePage extends HookWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final app = context.watch<AppState>();
    final me = app.me;

    final firstName = useTextEditingController(text: me.firstName);
    final middleName = useTextEditingController(text: me.middleName);
    final lastName = useTextEditingController(text: me.lastName);
    final nickname = useTextEditingController(text: me.nickname);

    return Scaffold(
      appBar: AppBar(
        title: Text('Профиль'),
      ),
      body: Column(
        children: [
          Text(me.role.runame),
          Text(me.email),
          TextField(
            controller: nickname,
            decoration: InputDecoration(hintText: 'nickname'),
          ),
          TextField(
            controller: firstName,
            decoration: InputDecoration(hintText: 'firstName'),
          ),
          TextField(
            controller: middleName,
            decoration: InputDecoration(hintText: 'middleName'),
          ),
          TextField(
            controller: lastName,
            decoration: InputDecoration(hintText: 'lastName'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            child: const Text(
              "Сохранить",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              await Network.I.updateProfile(
                firstName: firstName.text.nullIfEmpty,
                lastName: lastName.text.nullIfEmpty,
                middleName: middleName.text.nullIfEmpty,
                nickname: nickname.text.nullIfEmpty,
              );
              app.refreshMe();
            },
          ),
          const SizedBox(height: 8),
          ElevatedButton(
              child: const Text(
                "Загрузить аватар",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                const XTypeGroup typeGroup = XTypeGroup(
                  label: 'images',
                  extensions: <String>['jpg', 'png'],
                );
                final XFile? file =
                    await openFile(acceptedTypeGroups: <XTypeGroup>[typeGroup]);
                app.refreshMe();
              }),
        ],
      ).constrained(width: 400).center(),
    );
  }
}
