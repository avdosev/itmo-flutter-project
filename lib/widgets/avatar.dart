import 'package:flutter/material.dart';

import '../api/auth_service.dart';

class Avatar extends StatelessWidget {
  final String? url;
  final double size;

  const Avatar({
    super.key,
    required this.url,
    this.size = 32,
  });

  @override
  Widget build(BuildContext context) {
    final u = url;
    if (u == null) {
      return const SizedBox.shrink();
    }
    return CircleAvatar(
      radius: size,
      child: Image.network(
        u,
        headers: {
          'Authorization': 'Bearer ${AuthService.I.token!}',
        },
      ),
    );
  }
}
