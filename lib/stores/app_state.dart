import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:mpi_front/api/auth_service.dart';
import 'package:mpi_front/api/network.dart';
import 'package:mpi_front/models/models.dart';

class AppState extends ChangeNotifier {
  UserType get activeUserType => me.role;

  User get me => _me!;

  User? _me;
  bool hasNotifications = true;

  late Timer _timer;

  AppState() {
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      checkNotices();
    });
  }

  void auth(AuthState auth) {
    AuthService.I.authorize(auth.token);
    _me = auth.user;
    checkNotices();
  }

  void refreshMe() async {
    _me = await Network.I.currentUser();
    notifyListeners();
  }

  Future<void> checkNotices() async {
    if (_me == null) return;
    final prev = hasNotifications;
    hasNotifications = await Network.I.hasNotifications();
    if (prev != hasNotifications) notifyListeners();
  }

  void logout() {
    AuthService.I.logout();
    hasNotifications = false;
  }
}
