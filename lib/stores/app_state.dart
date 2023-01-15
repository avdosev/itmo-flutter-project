import 'package:flutter/cupertino.dart';
import 'package:mpi_front/api/auth_service.dart';
import 'package:mpi_front/api/network.dart';
import 'package:mpi_front/models/models.dart';

class AppState extends ChangeNotifier {
  UserType get activeUserType => me.role;

  User get me => _me!;

  User? _me;

  AppState();

  void auth(AuthState auth) {
    AuthService.I.authorize(auth.token);
    _me = auth.user;
  }

  void refreshMe() async {
    _me = await Network.I.currentUser();
    notifyListeners();
  }

  void logout() {
    AuthService.I.logout();
  }
}
