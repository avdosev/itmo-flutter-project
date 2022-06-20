import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:mpi_front/api/network.dart';
import 'package:mpi_front/widgets/artifact_preview.dart';
import 'package:mpi_front/widgets/empty_state.dart';
import 'package:mpi_front/widgets/loader.dart';
import 'package:mpi_front/widgets/notice_preview.dart';

class NotificationsPage extends HookWidget {
  const NotificationsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final asyncArtifacts = useMemoized(() => Network.I.notices());
    final snapshot = useFuture(asyncArtifacts);
    if (!snapshot.hasData) {
      return const Loader();
    }
    final notices = snapshot.data!;
    return Scaffold(
      appBar: AppBar(
        title: Text('Уведомления'),
      ),
      body: notices.isEmpty
          ? const EmptyState()
          : ListView.separated(
              itemCount: notices.length,
              itemBuilder: (context, index) {
                final notice = notices[index];
                return NoticePreview(
                  notice: notice,
                  action: () => context.push('/order/${notice.orderId}'),
                );
              },
              separatorBuilder: (_, __) => const Divider(color: Colors.black),
            ),
    );
  }
}
